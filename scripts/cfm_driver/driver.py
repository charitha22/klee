import os
import sys
import optparse as op

def main():
    # define an option parser
    parser = op.OptionParser()
    # option to take input bitcode file
    parser.add_option("-i", "--input-bc", dest="input_bc", help="Input bitcode file")
    # option to take klee options file
    parser.add_option("-k", "--klee-options", dest="klee_options", help="Klee options file")
    # option for run-on directory
    parser.add_option("-r", "--run-on-dir", dest="run_on_dir", help="Run on directory")

    # parse the options
    (options, args) = parser.parse_args()

    # print the options
    print(options.input_bc) 
    print(options.klee_options)
    print(options.run_on_dir)

    pass

if __name__ == '__main__':
    main()