#!/usr/bin/python3
import subprocess, os, re, time, multiprocessing, psutil, json
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from multiprocessing import Queue

DEBUG = False

test_dirs = ['./false_positive/', './erosion/', './dilation/', './detect_edges/']
test_names = ['false_positive', 'erosion', 'dilation', 'detect_edges']

# test_dirs = ['./false_positive/']
# test_names = ['false_positive']

config = {
  ## CHANGE THESE FOR YOUR SPECIFIC BUILD SYSTEM
  'KLEE_BUILD_DIR': os.environ['KLEE_BUILD_DIR'],
  'LLVM_BUILD_DIR': os.environ['LLVM_BUILD_DIR'],
  ## SETTINGS BELOW CAN BE LEFT UNCHANGED
  'CLANG': lambda: config['LLVM_BUILD_DIR'] + "/bin/clang",
  'OPT': lambda: config['LLVM_BUILD_DIR'] + "/bin/opt",
  'CFMSE_FLAGS': "--enable-new-pm -mem2reg -S",
  'KLEE_INCLUDE': lambda: config['KLEE_BUILD_DIR'] + "/../include",
  'CLANG_FLAGS': lambda: "-I " + config['KLEE_INCLUDE']() + " -emit-llvm -S -Xclang -disable-O0-optnone -g",
  'KLEE_NOCFM_OPTIONS': "--max-memory=51200 --max-time=1h --only-output-states-covering-new --write-cov",
  'KLEE_CFM_OPTIONS': lambda: config['KLEE_NOCFM_OPTIONS'] + " -klee-cfmse",
  'KLEE_BIN': lambda: config['KLEE_BUILD_DIR'] + "/bin/klee",
  'KTEST_BIN': lambda: config['KLEE_BUILD_DIR'] + "/bin/ktest-tool",
  'JSON_FILE_NAME': "./klee_cfmse_ignore.json"
}

def getErrorLocationInformation(ktest_err_path):
  with open(ktest_err_path, "r") as f:
    data = f.read()
  
  ## Get line number of error
  line_number = "all" ## default case if no line number is found
  line_number_match = re.search(r"Line: (\d+)", data)
  if line_number_match:
    line_number = line_number_match.group(1)
  
  ## Get function causing error
  function_name = None
  stack_trace_match = re.search(r"Stack: \n((?:\t#[0-9]+ .+\n)+)", data)
  if stack_trace_match:
    stack_data = stack_trace_match.group(1)
    function_name_match = re.search(r"#\d+ in ([^(]+) ", stack_data)
    
    if function_name_match:
      function_name = function_name_match.group(1)
  
  ## Get file causing error
  file_name = None
  file_path_match = re.search(r"File: (.+)", data)
  if file_path_match:
    file_path = file_path_match.group(1)
    #file_name = os.path.basename(file_path)
    file_name = file_path
  
  return (file_name, function_name, line_number)

def analyzeErroringTest(false_positive_objects_queue, ktest_err_path, ktest_path, test_directory, testfile_prefix):
      processID = os.getpid()
      error_location_data = getErrorLocationInformation(ktest_err_path) ## acquires the line number and function name of erroring test if exists
      print("Analyzing Erroring Test:", ktest_path)
      print("Test Directory:", test_directory)
      print("Testfile Prefix:", testfile_prefix)
      if DEBUG:
        subprocess.run([config['KTEST_BIN'](), ktest_path]) ## outputs failing test inputs
      
      command = config['KLEE_BIN']() + " --replay-ktest-file=" + ktest_path + " " + test_directory + testfile_prefix + ".ll"
      if DEBUG:
        print(command)
      print("\033[1;35m", end = "")
      print("KLEE replaying test ->", ktest_path, end ="")
      print("\033[0m")
      process = subprocess.Popen(command, stderr=subprocess.PIPE, shell=True)
      error_detected = False
      
      while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()
        
        if b'KLEE: ERROR' in output:
          print("\033[1;31m",end ="")
          print(output_str, end ="")
          print("\033[0m")
          
          ## check if error is the same error generated from given test or another error
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
        
      #return_code = process.poll()
      if(not error_detected):
        false_positive_object = (ktest_path, True, error_location_data[0], error_location_data[1], error_location_data[2])
        false_positive_objects_queue.put(false_positive_object)
        print("\033[1;32mErroring Test is a false positive ->", ktest_path , end ="")
        print("\033[0m")
      else:
        false_positive_object = (ktest_path, False, error_location_data[0], error_location_data[1], error_location_data[2])
        false_positive_objects_queue.put(false_positive_object)
        print("\033[1;31mErroring Test is a real error ->", ktest_path , end ="")
        print("\033[0m")
  
class TestDirectoryHandler(FileSystemEventHandler):
    def __init__(self, process_queue, false_positive_objects_queue):
      super().__init__
      self.main_test_output_directory = ""
      self.process_queue = process_queue
      self.false_positive_objects_queue = false_positive_objects_queue
        
    def on_any_event(self, event):
        if event.event_type == 'modified':
            if(".err" in event.src_path): # if an erroring test case has been made
              test_output_directory = os.path.dirname(event.src_path)
              if(self.main_test_output_directory == "" or self.main_test_output_directory == test_output_directory):
                print(f"Erroring Test is: {event.src_path}")
              match = re.search(r"test\d{6}", event.src_path)
              if match:
                test_number = match.group(0)
                ktest_err_path = event.src_path
                test_directory = os.path.dirname(test_output_directory) + "/"
                index_of_test_directory = test_dirs.index(test_directory)
                testname_prefix = test_names[index_of_test_directory]
                
                ## analyze if error is a false positive
                if(self.main_test_output_directory == "" or self.main_test_output_directory == test_output_directory):
                  new_process = multiprocessing.Process(target=analyzeErroringTest, args=(self.false_positive_objects_queue, ktest_err_path, test_output_directory + "/" + test_number + ".ktest", test_directory, testname_prefix))
                  new_process.start() ## run false positive error analysis on different process
                  self.process_queue.put(new_process.pid)
                  self.main_test_output_directory = test_output_directory
              else:
                print("No match found")

if __name__ == "__main__":
  
  for index in range(len(test_dirs)):
    print("---------------------------------------------------------------------------")
    test_dir = test_dirs[index]
    testname_prefix = test_names[index]
    c_file = test_dir + testname_prefix + ".c"
    ll_file = test_dir + testname_prefix + ".ll"
    print("\033[1;35m", end ="")
    print("KLEE executing test ->", test_dir, end ="")
    print("\033[0m")
    # Clean test directory
    subprocess.run(['make', 'clean', '-C', test_dir, '--no-print-directory'])
    
    # Make .ll file
    command = config['CLANG']() + " " \
      + config['CLANG_FLAGS']() + " " \
      + c_file \
      + " -o " + ll_file
    if DEBUG:
      print(command)
    subprocess.run(command, shell=True)
    
    # Run opt on .ll file
    command = config['OPT']() + " -f " \
      + config['CFMSE_FLAGS'] + " -o " \
      + ll_file + " < " + ll_file
    if DEBUG:
      print(command)
    subprocess.run(command, shell=True)
    
    re_execute_klee_with_transformation = True
    false_positives_information = {}
    while re_execute_klee_with_transformation:
      #Execute KLEE with transformation on program
      if not false_positives_information: ## no false positives so far
        command = config['KLEE_BIN']() + " " + config['KLEE_CFM_OPTIONS']() + " " + ll_file
      else:
        command = config['KLEE_BIN']() + " " + config['KLEE_CFM_OPTIONS']() + " -klee-cfmse-dont-touch-locs=" + config["JSON_FILE_NAME"] + " " + ll_file 
      
      if DEBUG:
        print(command)
      
      ## start a process to detect when files get added/changed
      process_queue = Queue()
      false_positive_objects_queue = Queue()
      observer = Observer()
      path = test_dir
      event_handler = TestDirectoryHandler(process_queue, false_positive_objects_queue)
      observer.schedule(event_handler, path, recursive=True)
      observer.start()
      
      process = subprocess.Popen(command, stderr=subprocess.PIPE, shell=True)
      
      while True:
        # Read a line from the subprocess's standard output
        output = process.stderr.readline()
        output_str = output.decode().strip()
        
        if(DEBUG):
          print(output_str)
        
        if(DEBUG):
          if b'KLEE: WARNING' in output:
            print("\033[1;35m", end ="")
            print(output_str, end ="")
            print("\033[0m")
        
        if b'KLEE: ERROR' in output:
          print("\033[1;31m",end ="")
          print(output_str, end ="")
          print("\033[0m")
        
        if b'KLEE: done:' in output:
          print("\033[1;32m",end ="")
          print(output_str, end ="")
          print("\033[0m")

        # If there's no more output, break the loop
        if output == b'' and process.poll() is not None:
          break

      # Get the subprocess's return code
      return_code = process.poll()

      # Print the return code
      if(return_code == 0):
        print("\033[1;32mSymbolic execution with transform finished successfully for test ->", test_dir, end ="")
        print("\033[0m")
      else:
        print("\033[1;31mSymbolic execution with transform failed for test ->", test_dir, end ="")
        print("\033[0m")
      
      ## waits for all false positive checking process to finish before moving to next test
      while not process_queue.empty():
        process_id = process_queue.get()
        try:
          process = psutil.Process(process_id)
          process.wait()
        except:
          pass
      
      new_false_positives = []
      while not false_positive_objects_queue.empty():
        false_positive_object = false_positive_objects_queue.get()
        if DEBUG:
          print(false_positive_object)
        if(false_positive_object[1] == True): # if erroring test is a false positive
          new_false_positives.append(false_positive_object)
      observer.stop()
      observer.join()
      
      # new_false_positive format (ktest_path, isFalsePositive, error_file_name, error_function_name, error_line_number)
      # following block appends new found false positives to false positive dictionary
      for new_false_positive in new_false_positives:
        file_name = new_false_positive[2]
        if file_name in false_positives_information:
          function_name = new_false_positive[3]
          if function_name in false_positives_information[file_name]:
            error_line_number = new_false_positive[4]
            if false_positives_information[file_name][function_name] != "all":
              if error_line_number == "all":
                false_positives_information[file_name][function_name] = "all"
              else :
                false_positives_information[file_name][function_name].append(int(error_line_number))
          else:
            error_line_number = new_false_positive[4]
            if error_line_number == "all":
              false_positives_information[file_name][function_name] = "all"
            else:
              false_positives_information[file_name][function_name] = [int(error_line_number)]
        else:
          function_name = new_false_positive[3]
          error_line_number = new_false_positive[4]
          if error_line_number == "all":
            false_positives_information[file_name] = {function_name : "all"}
          else:
            false_positives_information[file_name] = {function_name : [int(error_line_number)]}
      
      if DEBUG:
        print(false_positives_information)
        
      # dumps false positive location information to json so klee can use in next iteration
      with open(config["JSON_FILE_NAME"], "w") as outfile:
        json.dump(false_positives_information, outfile)
        
      if len(new_false_positives) == 0: ## if no false positives were found on run, terminate loop and move to next test
        re_execute_klee_with_transformation = False
      else:
        print("\033[1;35m", end = "")
        print("KLEE re-executing to remove false positves for test ->", test_dir, end ="")
        print("\nUsing false positive locations information ->", false_positives_information, end="")
        print("\033[0m")
        

  
  