import os
import pandas as pd
import numpy as np
import glob
import sys
import pandas as pd

# bench_dirs = ['bitonic_sort', 'connected_comp', 'detect_edges', 'dilation', 'erosion', 'floyd_warshall', 'kruskal', 'prim', 'toupper', 'transitive_closure']
input_sizes = {'toupper': [10], 'connected_comp': [3], 'kruskal': [3], 'prim': [
    3], 'transitive_closure': [3], 'detect_edges': [3], 'dilation': [4], 'erosion': [4]}
stats_from_klee_stat = ['Instrs', 'Time(s)', 'Queries', 'TSolver(%)', 'AvgSolverQuerySize',
         'MaxMem(MiB)']
other_stats = ['Explored_Paths', 'Generated_Tests', 'Completed_Paths']

result_dict = {'Benchmark': [], 'Input_Size': [], 'Technique': [], 'Instrs': [], 'Time(s)': [], 'Queries': [], 'TSolver(%)': [
], 'AvgSolverQuerySize': [], 'MaxMem(MiB)': [], 'Explored_Paths': [], 'Generated_Tests': [], 'Completed_Paths': []}
results = pd.DataFrame(result_dict)


def extract_value_from_file(f):
    explored_paths = "NA"
    generated_tests = "NA"
    completed_paths = "NA"

    if not os.path.exists(f):
        return explored_paths, generated_tests, completed_paths

    with open(f) as f:
        for line in f:
            if 'KLEE: done: explored paths' in line:
                explored_paths = int(line.split(' = ')[1])
            if 'KLEE: done: generated tests' in line:
                generated_tests = int(line.split(' = ')[1])
            if 'KLEE: done: completed paths' in line:
                completed_paths = int(line.split(' = ')[1])
    return explored_paths, generated_tests, completed_paths

def print_klee_stats(bench, input_size):

    # create empty dataframes for klee, klee_cfm, klee_sm and klee_cfmsm
    df_klee = pd.DataFrame()
    df_klee_cfm = pd.DataFrame()
    df_klee_sm = pd.DataFrame()
    df_klee_cfmsm = pd.DataFrame()

    # list files for 4 techniques
    files_klee = glob.glob(bench + f'/klee_stats_{input_size}*.csv')
    files_cfm = glob.glob(bench + f'/klee_cfm_stats_{input_size}*.csv')
    files_sm = glob.glob(bench + f'/klee_sm_stats_{input_size}*.csv')
    files_cfmsm = glob.glob(
        bench + f'/klee_cfmsm_stats_{input_size}*.csv')

    # if any of above list is empty, print error message and exit
    if len(files_cfm) == 0 or len(files_sm) == 0 or len(files_cfmsm) == 0:
        print(
            f'Error: No files found for {bench} with input size {input_size}')
        exit(-1)

    for f in files_klee:
        # read csv file and append the last row to the dataframe
        df_klee = df_klee.append(pd.read_csv(f).tail(1))

    for f in files_cfm:
        # read csv file and append the last row to the dataframe
        df_klee_cfm = df_klee_cfm.append(pd.read_csv(f).tail(1))

    for f in files_sm:
        # read csv file and append the last row to the dataframe
        df_klee_sm = df_klee_sm.append(pd.read_csv(f).tail(1))

    for f in files_cfmsm:
        # read csv file and append the last row to the dataframe
        df_klee_cfmsm = df_klee_cfmsm.append(pd.read_csv(f).tail(1))

    # print the median of the stats for each dataframe
    klee_stats = []
    klee_cfm_stats = []
    klee_sm_stats = []
    klee_cfmsm_stats = []

    for stat in stats_from_klee_stat:
        # print stat name
        # print(f'{stat}:')
        # print(f'KLEE,KLEE-CFM, KLEE-SM, KLEE-CFM-SM')
        # print(
        #     f'{df_klee[stat].median()},{df_klee_cfm[stat].median()}, {df_klee_sm[stat].median()}, {df_klee_cfmsm[stat].median()}')
        # print('')
        klee_stats.append(df_klee[stat].median())
        klee_cfm_stats.append(df_klee_cfm[stat].median())
        klee_sm_stats.append(df_klee_sm[stat].median())
        klee_cfmsm_stats.append(df_klee_cfmsm[stat].median())

    log_file_klee = glob.glob(bench + f'/klee_{input_size}_1.log')[0]
    log_file_cfm = glob.glob(bench + f'/klee_cfm_{input_size}_1.log')[0]
    log_file_sm = glob.glob(bench + f'/klee_sm_{input_size}_1.log')[0]
    log_file_cfmsm = glob.glob(
        bench + f'/klee_cfmsm_{input_size}_1.log')[0]

    # open log_file_klee and itearte over the lines
    for stat in extract_value_from_file(log_file_klee):
        klee_stats.append(stat)
    for stat in extract_value_from_file(log_file_cfm):
        klee_cfm_stats.append(stat)
    for stat in extract_value_from_file(log_file_sm):
        klee_sm_stats.append(stat)
    for stat in extract_value_from_file(log_file_cfmsm):
        klee_cfmsm_stats.append(stat)

    

    results.loc[len(results)] = [bench, input_size, 'KLEE'] + klee_stats
    results.loc[len(results)] = [bench, input_size,
                                 'KLEE-CFM'] + klee_cfm_stats
    results.loc[len(results)] = [bench, input_size, 'KLEE-SM'] + klee_sm_stats
    results.loc[len(results)] = [bench, input_size,
                                 'KLEE-CFM-SM'] + klee_cfmsm_stats




if __name__ == '__main__':

    bench_dirs = sys.argv[1:]
    for bench in bench_dirs:
        for input_size in input_sizes[bench]:
            print_klee_stats(bench, input_size)
            # print_path_stats(bench, input_size)

    print(results.to_csv(index=False))
