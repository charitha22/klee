import json
import os
import sys
import optparse as op
from core import run_main

# global config
config = {
    'KLEE_BUILD_DIR': os.environ['KLEE_BUILD_DIR'],
    'LLVM_BUILD_DIR': os.environ['LLVM_BUILD_DIR'],
    'KLEE_BIN': lambda: config['KLEE_BUILD_DIR'] + "/bin/klee",
    'KTEST_BIN': lambda: config['KLEE_BUILD_DIR'] + "/bin/ktest-tool",
    'CFMSE_IGNORE_JSON': "cfmse_ignore.json",
    'KLEE_OPTIONS' : "--max-memory=51200 --max-time=1h --only-output-states-covering-new --write-cov",
    'CFM_OPTIONS' : "-klee-cfmse -klee-cfmse-loads-symbolic"
}

def main():
    # define an option parser
    parser = op.OptionParser()
    # option to take input bitcode file
    parser.add_option("-i", "--input-bc", dest="input_bc", help="Input bitcode file")
    # option to take klee options file
    parser.add_option("-k", "--klee-options-json", dest="klee_options_json", help="Klee options file")
    # option for run-on directory
    parser.add_option("-r", "--run-on-dir", dest="run_on_dir", help="Run on directory")

    # parse the options
    (options, args) = parser.parse_args()


    # if input bitcode file is not provided then exit
    if not options.input_bc:
        print("Input bitcode file not provided")
        sys.exit(1)
    
    # if klee options file is not provided then exit
    if not options.klee_options_json:
        print("KLEE options json not provided")
        sys.exit(1)

    # if run-on directory is not provided then use the current directory
    if not options.run_on_dir:
        options.run_on_dir = os.getcwd()

    # read the klee options json
    with open(options.klee_options_json, 'r') as f:
        klee_options = json.load(f)
        
        if 'KLEE_OPTIONS' in klee_options:
            print("Overriding KLEE_OPTIONS")
            config['KLEE_OPTIONS'] = klee_options['KLEE_OPTIONS']
        if 'CFM_OPTIONS' in klee_options:
            print("Overriding CFM_OPTIONS")
            config['CFM_OPTIONS'] = klee_options['CFM_OPTIONS']

    print("Runnign CFMSE driver with follwing options:")
    print("-------------------------------------------")
    print("Input bitcode file\t: {}".format(options.input_bc))
    print("KLEE options\t\t: {}".format(config['KLEE_OPTIONS']))
    print("CFM options\t\t: {}".format(config['CFM_OPTIONS']))
    print("Run on directory\t: {}".format(options.run_on_dir))
    print("-------------------------------------------")

    # run the driver
    run_main(options.input_bc, config, options.run_on_dir)

    

if __name__ == '__main__':
    main()