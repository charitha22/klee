import pandas as pd
import numpy as np
import glob

# bench_dirs = ['bitonic_sort', 'connected_comp', 'detect_edges', 'dilation', 'erosion', 'floyd_warshall', 'kruskal', 'prim', 'toupper', 'transitive_closure']
bench_dirs = ['toupper']
innput_sizes = {'toupper' : [10]}
stats = ['Instrs', 'Time(s)',
       'TSolver(%)', 
       'TCex(%)', 'Queries', 'QueryConstructs', 'AvgSolverQuerySize', 'MaxMem(MiB)', 'AvgMem(MiB)']

for bench in bench_dirs:
    # print bench mark name 
    print(f' ===== Benchmark: {bench} =====')
    print('')
    for input_size in innput_sizes[bench]:
        # create empty dataframes for klee, klee_cfm, klee_sm and klee_cfmsm
        df_klee = pd.DataFrame()
        df_klee_cfm = pd.DataFrame()
        df_klee_sm = pd.DataFrame()
        df_klee_cfmsm = pd.DataFrame()

      
        # list files for 4 techniques
        files_klee = glob.glob(bench + f'/klee_stats_{input_size}*.csv')
        files_cfm = glob.glob(bench + f'/klee_cfm_stats_{input_size}*.csv')
        files_sm = glob.glob(bench + f'/klee_sm_stats_{input_size}*.csv')
        files_cfmsm = glob.glob(bench + f'/klee_cfmsm_stats_{input_size}*.csv')

        # if any of above list is empty, print error message and exit
        if len(files_klee) == 0 or len(files_cfm) == 0 or len(files_sm) == 0 or len(files_cfmsm) == 0:
            print(f'Error: No files found for {bench} with input size {input_size}')
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
        

        # print input size
        print(f'Input Size: {input_size}')
        # print the median of the stats for each dataframe
        for stat in stats:
            # print stat name
            print(f'{stat}:')
            print(f'KLEE : {df_klee[stat].median()}')
            print(f'KLEE-CFM : {df_klee_cfm[stat].median()}')
            print(f'KLEE-SM : {df_klee_sm[stat].median()}')
            print(f'KLEE-CFMSM : {df_klee_cfmsm[stat].median()}')
            print('')

        

