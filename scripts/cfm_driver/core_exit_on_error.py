#!/usr/bin/python3
import subprocess
import os
import re
import time
import multiprocessing
import psutil
import json
import signal
import sys
import glob
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from multiprocessing import Queue


DEBUG = True 


def debug_print(*args, **kwargs):
    if DEBUG:
        print("DEBUG : ", end="")
        print(*args, **kwargs)


def getErrorLocationInformation(ktest_err_path):
    with open(ktest_err_path, "r") as f:
        data = f.read()

    # Get line number of error
    line_number = "all"  # default case if no line number is found
    line_number_match = re.search(r"Line: (\d+)", data)
    if line_number_match:
        line_number = line_number_match.group(1)

    # Get function causing error
    function_name = None
    stack_trace_match = re.search(r"Stack: \n((?:\t#[0-9]+ .+\n)+)", data)
    if stack_trace_match:
        stack_data = stack_trace_match.group(1)
        function_name_match = re.search(r"#\d+ in ([^(]+) ", stack_data)

        if function_name_match:
            function_name = function_name_match.group(1)

    # Get file causing error
    file_name = None
    file_path_match = re.search(r"File: (.+)", data)
    if file_path_match:
        file_path = file_path_match.group(1)
        # file_name = os.path.basename(file_path)
        file_name = file_path

    return (file_name, function_name, line_number)


def analyzeErroringTest(ktest_path, bitcode_path, error_location_data):

    debug_print("Analyzing Erroring Test:", ktest_path)

    command = config['KLEE_BIN']() + " --replay-ktest-file=" + \
        ktest_path + " " + bitcode_path + " " + str(config['PROG_ARGS'])

    debug_print("Executing : " + command)

    print("\033[1;35m", end="")
    print("KLEE replaying test ->", ktest_path, end="")
    print("\033[0m")
    process = subprocess.Popen(command, stderr=subprocess.PIPE, shell=True)
    error_detected = False

    while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()

        if b'KLEE: ERROR' in output:
            print("\033[1;31m", end="")
            print("KLEE: ERROR: In replaying erroring test!")
            print(output_str, end="")
            print("\033[0m")

            # check if error is the same error generated from given test or another error
            error_match = re.search(r'(\.\/.+):(\d+)', output_str)
            error_detected = True
            if error_match:
                file_name = error_match.group(1)
                line_number = error_match.group(2)
                if (file_name == error_location_data[0]) and (int(line_number) == int(error_location_data[2])):
                    error_detected = True
                else:
                    error_detected = False
        # If there's no more output, break the loop
        if output == b'' and process.poll() is not None:
            break

    
    # error_detected is true means its a true error
    return error_detected


def executeKleeWithoutTransformation(input_bitcode, output_dir, process_start_time, klee_options):
    print(f"Running KLEE without CFM inside {output_dir}")
    klee_command = f"{str(config['KLEE_BIN']())} {klee_options} --output-dir={output_dir} {input_bitcode} {str(config['PROG_ARGS'])}"

    debug_print("Executing : " + klee_command)
    # start a new process to execute KLEE
    process = subprocess.Popen(
        klee_command, stderr=subprocess.PIPE, shell=True)

    while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()

        # debug_print(output_str)

        if b'KLEE: WARNING' in output:
            print("\033[1;35m", end="")
            print(output_str, end="")
            print("\033[0m")

        if b'KLEE: ERROR' in output:
            error_time = time.time() - process_start_time
            print("\033[1;31m", end="")
            print("KLEE: ERROR: In non-transformed KLEE execution!")
            print(output_str, end="")
            print("\nError found in seconds:", error_time, end="")
            print("\033[0m")

        if b'KLEE: done:' in output:
            print("\033[1;32m", end="")
            print(output_str, end="")
            print("\033[0m")

        # If there's no more output, break the loop
        if output == b'' and process.poll() is not None:
            break

    # Get the subprocess's return code
    return_code = process.poll()

    # Print the return code
    if (return_code == 0):
        print(
            "\033[1;32mSymbolic execution WITHOUT transformation finished successfully", end="")
        print("\033[0m")
    else:
        print(
            "\033[1;31mSymbolic execution WITHOUT transform failed!", end="")
        print("\033[0m")


def keyboard_exit_handler(sig, frame):
    print(f"\n\nKeyboardInterrupt (ID: {sig}) has been caught. Cleaning up...")

    def kill_child_processes_recursive(parent_pid, sig=signal.SIGTERM):
        try:
            parent = psutil.Process(parent_pid)
        except psutil.NoSuchProcess:
            return
        children = parent.children(recursive=True)
        for process in children:
            process.send_signal(sig)

    print("Killing all child processes...")
    kill_child_processes_recursive(os.getpid())
    print("Exiting...")
    sys.exit(0)


# Register the signal handler for SIGINT signal
signal.signal(signal.SIGINT, keyboard_exit_handler)


class FalsePositiveDict:
    def __init__(self):
        self.dict = {}

    def set_default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        raise TypeError

    def addLocInfo(self, filename, funcname, lineno):
        if filename not in self.dict:
            self.dict[filename] = {}
        if funcname not in self.dict[filename]:
            self.dict[filename][funcname] = set()
        self.dict[filename][funcname].add(lineno)

    def hasLocInfo(self, filename, funcname, lineno):
        if filename not in self.dict:
            return False
        if funcname not in self.dict[filename]:
            return False
        if lineno not in self.dict[filename][funcname]:
            return False
        return True

    def size(self):
        return len(self.dict)

    def toJson(self):
        return json.dumps(self.dict, default=self.set_default)


def parse_time_from_option_string(option_string):
    # look for substings of the form --max-time=[0-1]+[h|s]
    # and extract it into a tuple of (max_time, time_unit)
    # where time_unit is either 'h' or 's'
    # if no such substring is found, return None
    match = re.search(r"--max-time=([0-9]+)([h|s])", option_string)

    if not match:
        print("Error: --max-time option not found in KLEE options!")
        return None

    # if ths substring is found, remove the substring from the option string
    option_string = option_string.replace(match.group(0), "")

    # print("KLEE option string after removing --max-time option: " + option_string)

    max_time = int(match.group(1))
    time_unit = match.group(2)
    # print(f"Max time: {max_time} {time_unit}")

    # convert time to seconds
    if time_unit == 'h':
        max_time *= 3600

    # returns max time in seconds
    return [max_time, option_string]


def run_main(input_bitcode, config_, run_in_dir):

    # set the global config variable
    global config
    config = config_

    klee_options = str(config['KLEE_OPTIONS'])

    # if klee_options does not contain --max-time option, print error and exit
    if not "--max-time" in klee_options:
        print("Error: --max-time option not found in KLEE options!")
        sys.exit(1)

    # if klee_options does not contain --exit-on-error option add it
    if not "--exit-on-error" in klee_options:
        klee_options += " --exit-on-error "

    # parse the --max-time option from the KLEE options
    [max_time_in_seconds, klee_options_without_time] = parse_time_from_option_string(klee_options)

    # klee options for without transformation
    klee_without_cfm_options = klee_options_without_time + f" --max-time={max_time_in_seconds}s "

    # klee options for with transformation (but without --max-time option)
    klee_cfm_options_without_time = klee_options_without_time + f" {str(config['CFM_OPTIONS'])} "

    # if run_in_dir does not exist, print error and exit
    if not os.path.isdir(run_in_dir):
        print(f"Error: {run_in_dir} does not exist!")
        sys.exit(1)

    # if run_in_dir is not an abosolute path, make it an absolute path
    if not os.path.isabs(run_in_dir):
        run_in_dir = os.path.abspath(run_in_dir)

    # if input_bitcode file does not exist, print error and exit
    if not os.path.isfile(input_bitcode):
        print(f"Error: {input_bitcode} does not exist!")
        sys.exit(1)

    # if input_bitcode is not an abosolute path, make it an absolute path
    if not os.path.isabs(input_bitcode):
        input_bitcode = os.path.abspath(input_bitcode)

    # get current epoch time
    current_epoch = time.time()

    # create klee-cfm-run-<epoch-time> and klee-nocfm-<epoch-time> directories
    klee_cfm_dir = os.path.join(run_in_dir, "klee-cfm-run-" + str(int(current_epoch)))
    klee_nocfm_dir = os.path.join(run_in_dir, "klee-nocfm-" + str(int(current_epoch)))

    # get process start time
    start_time = time.time()

    # spawn a new process to execute KLEE without transformation
    print(f"Running klee without the transformation on {input_bitcode}")
    klee_without_transform_process=multiprocessing.Process(
        target=executeKleeWithoutTransformation, args=(input_bitcode, klee_nocfm_dir, start_time, klee_without_cfm_options))
    klee_without_transform_process.start()

    # false positives info
    false_positives_store = FalsePositiveDict()

    # number of times KLEE has been re-executed with transformation
    iteration = 0

    # keep re-executing KLEE with transformation until time limit is reached
    while time.time() - start_time < max_time_in_seconds:
        time_reminaing = max_time_in_seconds - int(time.time() - start_time)

        # Execute KLEE with transformation on program
        klee_with_cfm_options = f" {klee_cfm_options_without_time} --max-time={time_reminaing}s "

        if false_positives_store.size() == 0:  # no false positives so far
            command = f"{str(config['KLEE_BIN']())} {klee_with_cfm_options} --output-dir={klee_cfm_dir}_{iteration} {input_bitcode} {str(config['PROG_ARGS'])}"
        else: # there are false positives, ask CFM not to touch them plus seed from previous iteration
            command = f"{str(config['KLEE_BIN']())} {klee_with_cfm_options} -klee-cfmse-dont-touch-locs={str(config['CFMSE_IGNORE_JSON'])} --output-dir={klee_cfm_dir}_{iteration} --seed-dir={klee_cfm_dir}_{iteration-1} {input_bitcode} {str(config['PROG_ARGS'])}"

        debug_print("Executing : " + command)

        process=subprocess.Popen(
            command, stderr=subprocess.PIPE, shell=True)

        while True:
            # Read a line from the subprocess's standard output
            output=process.stderr.readline()
            output_str=output.decode().strip()

            # debug_print(output_str)

            if b'KLEE: WARNING' in output:
                print("\033[1;35m", end="")
                print(output_str, end="")
                print("\033[0m")

            if b'KLEE: ERROR' in output:
                error_time=time.time() - start_time
                print("\033[1;31m", end="")
                print("KLEE: ERROR: In transformed KLEE execution!")
                print("Error found in " + str(error_time) + " seconds")
                print(output_str, end="")
                print("\033[0m")

            if b'KLEE: done:' in output:
                print("\033[1;32m", end="")
                print(output_str, end="")
                print("\033[0m")

            # If there's no more output, break the loop
            if output == b'' and process.poll() is not None:
                break

        # Get the subprocess's return code
        return_code=process.poll()

        # Print the return code
        if (return_code == 0):
            print(
                "\033[1;32mSymbolic execution with CFM finished successfully", end="")
            print("\033[0m")
        else:
            print(
                "\033[1;31mSymbolic execution with transform failed!", end="")
            print("\033[0m")

        # check in the klee_cfm_dir for files with .err extension using glob
        klee_err_files = glob.glob(klee_cfm_dir + "/*.err")

        if not klee_err_files:
            print("No error files found! Exiting the driver loop..!")
            break

        if len(klee_err_files) > 1:
            print("WARN : More than one error file found.. Exiting the driver loop..!")
            break

        ktest_err_file = klee_err_files[0]

        # get the erro location info
        (filename, funcname, lineno) = getErrorLocationInformation(ktest_err_file)

        # from ktest.err file, find the test number of the form test[0-9]+.ktest
        # using regex
        test_num = re.search(r"test[0-9]+", ktest_err_file).group(0)
        ktest_file = os.path.join(klee_cfm_dir, test_num + ".ktest")

        # check if this error is a false positive
        true_error = analyzeErroringTest(ktest_file, input_bitcode, (filename, funcname, lineno))

        if true_error:
            print(f"True error found after {int(time.time() - start_time)} seconds")
            print("Exiting the driver loop..!")
            break

        print(f"False positive found after {int(time.time() - start_time)} seconds")
        print("Updading false positives info..!")

        # if this false positive is already in the dictionary, print an error and exit loop
        if false_positives_store.hasLocInfo(filename, funcname, lineno):
            print("False positive already found! Exiting the driver loop..!")
            break

        # add this false positive to the dictionary
        false_positives_store.addLocInfo(filename, funcname, lineno)

        # print the current false positives
        debug_print("False positives so far : ")
        print(false_positives_store.toJson())


        # dumps false positive location information to json so klee can use in next iteration
        with open(config["CFMSE_IGNORE_JSON"], "w") as outfile:
            json.dump(false_positives_store.toJson(), outfile)

        print("New false positive found! Re-executing KLEE with transformation..")
        iteration += 1

    if klee_without_transform_process.is_alive():
        print("\033[1;35m", end="")
        print(
            "Waiting for KLEE without Transformation to finish execution", end="")
        print("\033[0m")
    klee_without_transform_process.join()


