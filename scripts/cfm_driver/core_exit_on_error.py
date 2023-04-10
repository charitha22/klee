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


def debug_print(*args, tag="", **kwarg):
    if not DEBUG:
        return
    
    # print("DRIVER : ", end="")
    if tag != "":
        print(f"({tag}) : ", end="", flush=True)
    print(*args, **kwarg, flush=True)


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


def analyzeErroringTest(ktest_path, bitcode_path, error_location_data, klee_options):

    debug_print(f"Analyzing Erroring Test: {ktest_path}", tag="analyze")

    command = config['KLEE_BIN']() + " --replay-ktest-file=" + \
        ktest_path + f" {klee_options} " + bitcode_path + " " + str(config['PROG_ARGS'])

    debug_print("Executing : " + command, tag="analyze")
    process = subprocess.Popen(command, stderr=subprocess.PIPE, shell=True)
    error_detected = False

    while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()

        if b'KLEE: ERROR' in output:
            debug_print("Error detected when replaying test", tag="analyze")
            debug_print("KLEE OUTPUT " + output_str, tag="analyze")

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

    debug_print(f"Detected error is a {'TRUE ERROR!' if error_detected else 'FALSE POSITIVE!'}", tag="analyze")
    
    # error_detected is true means its a true error
    return error_detected


def executeKleeWithoutTransformation(input_bitcode, output_dir, process_start_time, klee_options):
    debug_print(f"Running KLEE without CFM inside {output_dir}", tag="klee-nocfm")
    klee_command = f"{str(config['KLEE_BIN']())} {klee_options} --output-dir={output_dir} {input_bitcode} {str(config['PROG_ARGS'])}"

    debug_print("Executing : " + klee_command, tag="klee-nocfm")
    # start a new process to execute KLEE
    process = subprocess.Popen(
        klee_command, stderr=subprocess.PIPE, stdout=subprocess.DEVNULL, shell=True)

    while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()

        debug_print(output_str, tag="klee-nocfm-stdout")

        if b'KLEE: ERROR: EXITING ON ERROR:' in output:
            error_time = time.time() - process_start_time
            debug_print(f"ERROR found in non-transformed KLEE run in {error_time} seconds!", tag="klee-nocfm")

        # If there's no more output, break the loop
        if output == b'' and process.poll() is not None:
            break

    debug_print("KLEE without CFM finished exploration", tag="klee-nocfm")


def keyboard_exit_handler(sig, frame):
    debug_print(f"\n\nKeyboardInterrupt (ID: {sig}) has been caught. Cleaning up...", tag="main")

    def kill_child_processes_recursive(parent_pid, sig=signal.SIGTERM):
        try:
            parent = psutil.Process(parent_pid)
        except psutil.NoSuchProcess:
            return
        children = parent.children(recursive=True)
        for process in children:
            process.send_signal(sig)

    debug_print("Killing all child processes...", tag="main")
    kill_child_processes_recursive(os.getpid())
    debug_print("Exiting...", tag="main")
    sys.exit(0)


# Register the signal handler for SIGINT signal
signal.signal(signal.SIGINT, keyboard_exit_handler)

def set_default( obj):
    if isinstance(obj, set):
        return list(obj)
    raise TypeError

class FalsePositiveDict:
    def __init__(self):
        self.dict = {}

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

    def getDict(self):
        return self.dict


def parse_time_from_option_string(option_string):
    # look for substings of the form --max-time=[0-1]+[h|s]
    # and extract it into a tuple of (max_time, time_unit)
    # where time_unit is either 'h' or 's'
    # if no such substring is found, return None
    match = re.search(r"--max-time=([0-9]+)([h|s])", option_string)



    if not match:
        debug_print("Error: --max-time option not found in KLEE options!", tag="main")
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

# function to extract the program name from a path to .bc file
def get_prog_name_from_bc_path(bc_path):
    # get the file name from the path
    file_name = os.path.basename(bc_path)

    # remove the .bc extension from the file name
    prog_name = file_name.replace(".bc", "").split('/')[-1]

    if prog_name is None:
        return ""

    return prog_name


def run_main(input_bitcode, config_, run_in_dir):

    # set the global config variable
    global config
    config = config_

    klee_options = str(config['KLEE_OPTIONS'])

    # if klee_options does not contain --max-time option, print error and exit
    if not "-max-time" in klee_options:
        debug_print(f"Error: --max-time option not found in KLEE options!" , tag="main")
        sys.exit(1)

    # if klee_options does not contain --exit-on-error option add it
    if not "-exit-on-error" in klee_options:
        klee_options += " --exit-on-error "

    # parse the --max-time option from the KLEE options
    [max_time_in_seconds, klee_options_without_time] = parse_time_from_option_string(klee_options)

    # klee options for without transformation
    klee_without_cfm_options = klee_options_without_time + f" --max-time={max_time_in_seconds}s "

    # klee options for with transformation (but without --max-time option)
    klee_cfm_options_without_time = klee_options_without_time + f" {str(config['CFM_OPTIONS'])} "

    # if run_in_dir does not exist, print error and exit
    if not os.path.isdir(run_in_dir):
        debug_print(f"Error: {run_in_dir} does not exist!" , tag="main")
        sys.exit(1)

    # if run_in_dir is not an abosolute path, make it an absolute path
    if not os.path.isabs(run_in_dir):
        run_in_dir = os.path.abspath(run_in_dir)

    # if input_bitcode file does not exist, print error and exit
    if not os.path.isfile(input_bitcode):
        debug_print(f"Error: {input_bitcode} does not exist!", tag="main")
        sys.exit(1)

    # if input_bitcode is not an abosolute path, make it an absolute path
    if not os.path.isabs(input_bitcode):
        input_bitcode = os.path.abspath(input_bitcode)

    # get current epoch time
    current_epoch = time.time()

    # get the program name from the input bitcode file
    prog_name = get_prog_name_from_bc_path(input_bitcode)

    # create klee-cfm-run-<epoch-time> and klee-nocfm-<epoch-time> directories
    klee_cfm_dir = os.path.join(run_in_dir, f"klee-cfm-run-{prog_name}-" + str(int(current_epoch)))
    klee_nocfm_dir = os.path.join(run_in_dir, f"klee-nocfm-{prog_name}-" + str(int(current_epoch)))

    # get process start time
    start_time = time.time()

    # spawn a new process to execute KLEE without transformation
    debug_print(f"Running klee without the transformation on {input_bitcode}", tag="main")
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

        klee_cfm_output_dirname = f"{klee_cfm_dir}_{iteration}"

        if false_positives_store.size() == 0:  # no false positives so far
            command = f"{str(config['KLEE_BIN']())} {klee_with_cfm_options} --output-dir={klee_cfm_output_dirname} {input_bitcode} {str(config['PROG_ARGS'])}"
        else: # there are false positives, ask CFM not to touch them plus seed from previous iteration
            command = f"{str(config['KLEE_BIN']())} {klee_with_cfm_options} -klee-cfmse-dont-touch-locs={str(config['CFMSE_IGNORE_JSON'])} --output-dir={klee_cfm_output_dirname} --seed-dir={klee_cfm_dir}_{iteration-1} {input_bitcode} {str(config['PROG_ARGS'])}"

        debug_print("Executing : " + command, tag="main")

        process=subprocess.Popen(
            command, stderr=subprocess.PIPE, stdout=subprocess.DEVNULL, shell=True)

        while True:
            # Read a line from the subprocess's standard output
            output=process.stderr.readline()
            output_str=output.decode().strip()

            debug_print(output_str, tag="klee_cfm_stdout")

            if b'KLEE: ERROR: EXITING ON ERROR:' in output:
                error_time = time.time() - start_time
                debug_print(f"ERROR found in CFM-transformed KLEE run in {error_time} seconds!", tag="klee-nocfm")

            # If there's no more output, break the loop
            if output == b'' and process.poll() is not None:
                break

        # Get the subprocess's return code
        return_code=process.poll()

        # Print the return code
        if (return_code == 0):
            debug_print("Symbolic execution with CFM finished successfully", tag="main")
        else:
            debug_print("Symbolic execution with transform failed!", tag="main")

        # check in the klee_cfm_dir for files with .err extension using glob
        klee_err_files = glob.glob(klee_cfm_output_dirname + "/*.err")

        if not klee_err_files:
            debug_print("No error files found! Exiting the driver loop..!", tag="main")
            break

        if len(klee_err_files) > 1:
            debug_print("WARN : More than one error file found.. Exiting the driver loop..!", tag="main")
            break

        ktest_err_file = klee_err_files[0]

        # get the erro location info
        (filename, funcname, lineno) = getErrorLocationInformation(ktest_err_file)

        # from ktest.err file, find the test number of the form test[0-9]+.ktest
        # using regex
        test_num = re.search(r"test[0-9]+", ktest_err_file).group(0)
        ktest_file = os.path.join(klee_cfm_output_dirname, test_num + ".ktest")

        # check if this error is a false positive
        true_error = analyzeErroringTest(ktest_file, input_bitcode, (filename, funcname, lineno), klee_without_cfm_options)

        if true_error:
            debug_print(f"KLEE with CFM found true error in {int(time.time() - start_time)} seconds", tag="main")
            debug_print("Exiting the driver loop..!", tag="main")
            break

        debug_print(f"KLEE with CFM found a false positive in {int(time.time() - start_time)} seconds", tag="main")
        debug_print("Updading false positives info..!", tag="main")

        # if this false positive is already in the dictionary, print an error and exit loop
        if false_positives_store.hasLocInfo(filename, funcname, lineno):
            debug_print("False positive already found! Exiting the driver loop..!", tag="main")
            break

        # add this false positive to the dictionary
        false_positives_store.addLocInfo(filename, funcname, lineno)

        # print the current false positives
        debug_print("False positives so far : ", tag="main")
        debug_print(false_positives_store.getDict(), tag="main")


        # dumps false positive location information to json so klee can use in next iteration
        with open(config["CFMSE_IGNORE_JSON"], "w") as outfile:
            json.dump(false_positives_store.getDict(), outfile, default=set_default)

        debug_print("New false positive found! Re-executing KLEE with transformation..", tag="main")
        iteration += 1

    if klee_without_transform_process.is_alive():
        debug_print("Waiting for KLEE without Transformation to finish execution",  tag="main")

    klee_without_transform_process.join()
    debug_print("Driver finished execution!", tag="main")


