import os
import pandas as pd
import numpy as np
import glob
import sys
import pandas as pd

# bench_dirs = ['bitonic_sort', 'connected_comp', 'detect_edges', 'dilation', 'erosion', 'floyd_warshall', 'kruskal', 'prim', 'toupper', 'transitive_closure']
input_sizes = {'toupper': [10, 50, 100], 'connected_comp': [3, 4, 5], 'kruskal': [3, 4, 5], 'prim': [
    4, 5, 6], 'transitive_closure': [3, 4, 5], 'detect_edges': [3, 4, 5], 'dilation': [4, 5, 6], 'erosion': [4], 'bitonic_sort': [4, 8, 16], 'floyd_warshall': [3, 4, 5], 'merge_sort' : [5, 10, 15]}
stats_from_klee_stat = ['Instrs', 'Time(s)', 'Queries', 'QCexCHits', 'TSolver(%)', 'AvgSolverQuerySize',
         'MaxMem(MiB)']
other_stats = ['Explored_Paths', 'Generated_Tests', 'Completed_Paths']

result_dict = {'Benchmark': [], 'Input_Size': [], 
               'Instrs-klee': [],'Instrs-cfm': [],'Instrs-sm': [],'Instrs-cfm-sm': [], 
               'Time(s)-klee': [],'Time(s)-cfm': [], 'Time(s)-sm': [], 'Time(s)-cfm-sm': [], 
               'Queries-klee': [],'Queries-cfm': [],'Queries-sm': [],'Queries-cfm-sm': [], 
                'QCexCHits-klee': [],'QCexCHits-cfm': [],'QCexCHits-sm': [],'QCexCHits-cfm-sm': [],
               'TSolver(%)-klee': [],'TSolver(%)-cfm': [],'TSolver(%)-sm': [],'TSolver(%)-cfm-sm': [],
               'AvgSolverQuerySize-klee': [],'AvgSolverQuerySize-cfm': [],'AvgSolverQuerySize-sm': [],'AvgSolverQuerySize-cfm-sm': [],
               'MaxMem(MiB)-klee': [],'MaxMem(MiB)-cfm': [],'MaxMem(MiB)-sm': [],'MaxMem(MiB)-cfm-sm': [],
               'Explored_Paths-klee': [], 'Explored_Paths-cfm': [], 'Explored_Paths-sm': [], 'Explored_Paths-cfm-sm': [], 
               'Generated_Tests-klee': [], 'Generated_Tests-cfm': [],'Generated_Tests-sm': [],'Generated_Tests-cfm-sm': [],
               'Completed_Paths-klee': [], 'Completed_Paths-cfm': [], 'Completed_Paths-sm': [],'Completed_Paths-cfm-sm': []}
results = pd.DataFrame(result_dict)


def extract_value_from_file(f):

    out = {'Explored_Paths': 'NA', 'Generated_Tests': 'NA', 'Completed_Paths': 'NA'}

    if not os.path.exists(f):
        return out
    
    explored_paths = 'NA'
    generated_tests = 'NA'
    completed_paths = 'NA'

    with open(f) as f:
        for line in f:
            if 'KLEE: done: explored paths' in line:
                explored_paths = int(line.split(' = ')[1])
            if 'KLEE: done: generated tests' in line:
                generated_tests = int(line.split(' = ')[1])
            if 'KLEE: done: completed paths' in line:
                completed_paths = int(line.split(' = ')[1])

    
    out['Explored_Paths'] = explored_paths
    out['Generated_Tests'] = generated_tests
    out['Completed_Paths'] = completed_paths
    return out

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
    if len(files_klee) == 0 and len(files_cfm) == 0 and len(files_sm) == 0 and len(files_cfmsm) == 0:
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

    for stat in stats_from_klee_stat:
        klee_val = df_klee[stat].median() if stat in df_klee.columns else "NA"
        klee_cfm_val = df_klee_cfm[stat].median() if stat in df_klee_cfm.columns else "NA"
        klee_sm_val = df_klee_sm[stat].median() if stat in df_klee_sm.columns else "NA"
        klee_cfmsm_val = df_klee_cfmsm[stat].median() if stat in df_klee_cfmsm.columns else "NA"

        klee_stats = klee_stats + [klee_val, klee_cfm_val, klee_sm_val, klee_cfmsm_val]

    log_file_klee = glob.glob(bench + f'/klee_{input_size}_1.log')[0] if glob.glob(bench + f'/klee_{input_size}_1.log') else "NA"
    log_file_cfm = glob.glob(bench + f'/klee_cfm_{input_size}_1.log')[0] if glob.glob(bench + f'/klee_cfm_{input_size}_1.log') else "NA"
    log_file_sm = glob.glob(bench + f'/klee_sm_{input_size}_1.log')[0] if glob.glob(bench + f'/klee_sm_{input_size}_1.log') else "NA"
    log_file_cfmsm = glob.glob(
        bench + f'/klee_cfmsm_{input_size}_1.log')[0] if glob.glob(bench + f'/klee_cfmsm_{input_size}_1.log') else "NA"

    # open log_file_klee and itearte over the lines
    other_stats_klee = extract_value_from_file(log_file_klee)
    other_stats_cfm = extract_value_from_file(log_file_cfm)
    other_stats_sm = extract_value_from_file(log_file_sm)
    other_stats_cfmsm = extract_value_from_file(log_file_cfmsm)

    for stat in other_stats:
        klee_stats = klee_stats + [other_stats_klee[stat], other_stats_cfm[stat], other_stats_sm[stat], other_stats_cfmsm[stat]]

    
    results.loc[len(results)] = [bench, input_size] + klee_stats




if __name__ == '__main__':

    bench_dirs = sys.argv[1:]
    for bench in bench_dirs:
        for input_size in input_sizes[bench]:
            print_klee_stats(bench, input_size)
            # print_path_stats(bench, input_size)

    print(results.to_csv(index=False))
