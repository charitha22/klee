#!/usr/bin/python3
import sys
import os
import glob
import pandas as pd
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def main():
    klee_nocfm_outputdir = sys.argv[1]
    klee_cfm_outputdir = sys.argv[2]

    nocfm_coverage_file = klee_nocfm_outputdir + "/coverage.csv"

    # check if the coverage file exists
    if not os.path.isfile(nocfm_coverage_file):
        print(f"Error: {nocfm_coverage_file} does not exist!")
        sys.exit(1)

    # print the name of the coverage file
    print(f"Found nocfm coverage file: {nocfm_coverage_file}")

    nocfm_df = pd.read_csv(nocfm_coverage_file, header=None)
    nocfm_df.columns = ["epoch", "coverage"]
    # print(nocfm_df.head())
    cfm_df = pd.DataFrame()
    
    # get all files of the form klee_cfm_outputdir_*/coverage.csv
    cfm_dirs = glob.glob(klee_cfm_outputdir + "*")

    for cfm_dir in cfm_dirs:
        cfm_coverage_file = cfm_dir + "/coverage.csv"

        # check if the coverage file exists
        if not os.path.isfile(cfm_coverage_file):
            print(f"Error: {cfm_coverage_file} does not exist!")
            sys.exit(1)

        # print the name of the coverage file
        print(f"Found cfm coverage file: {cfm_coverage_file}")

        # read the dataframe
        coverage_df = pd.read_csv(cfm_coverage_file, header=None)
        # print(coverage_df.head())
        coverage_df.columns = ["epoch", "coverage"]
        
        if cfm_df.empty:
            cfm_df = coverage_df
        else:
            cfm_df = cfm_df.append(coverage_df, ignore_index=True)

        
    
    # print(cfm_df)
    nocfm_x_values = nocfm_df["epoch"].tolist()
    nocfm_x_values = [x - nocfm_x_values[0] for x in nocfm_x_values]
    nocfm_y_values = nocfm_df["coverage"].tolist()

    cfm_x_values = cfm_df["epoch"].tolist()
    cfm_x_values = [x - cfm_x_values[0] for x in cfm_x_values]
    cfm_y_values = cfm_df["coverage"].tolist()

    # plot nocfm_y_values vs nocfm_x_values
    plt.plot(nocfm_x_values, nocfm_y_values, label="KLEE")
    plt.plot(cfm_x_values, cfm_y_values, label="KLEE+CFM")
    plt.legend()
    plt.xlabel("Time (s)")
    plt.ylabel("Coverage (%)")
    plt.savefig("coverage.png")
    

if __name__ == "__main__":
    main()