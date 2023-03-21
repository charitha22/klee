NRUNS=5

function run_bench  {
    echo "Running $1"
    # check if the directory exists
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist"
        exit 1
    fi

    cd $1
    rm -f *.log *.csv
    for input_size in $2; do
        echo "Input size: $input_size"
        make clean >> compile_$input_size.log 2>&1
        SIZE=$input_size make all >> compile_$input_size.log 2>&1
        for i in $(seq 1 $NRUNS); do
            echo "Run $i"
            echo "running klee"
            make klee >> klee_"$input_size"_"$i".log 2>&1
            cat klee-last/info >> klee_"$input_size"_"$i".log 2>&1
            ${KLEE_BUILD_DIR}/bin/klee-stats --print-all --table-format=csv klee-last/ >> klee_stats_"$input_size"_"$i".csv 2>&1
            echo "running klee_sm"
            make klee_sm >> klee_sm_"$input_size"_"$i".log 2>&1
            cat klee-last/info >> klee_sm_"$input_size"_"$i".log 2>&1
            ${KLEE_BUILD_DIR}/bin/klee-stats --print-all --table-format=csv klee-last/ >> klee_sm_stats_"$input_size"_"$i".csv 2>&1
            echo "running klee_cfm"
            make klee_cfm >> klee_cfm_"$input_size"_"$i".log 2>&1
            cat klee-last/info >> klee_cfm_"$input_size"_"$i".log 2>&1
            ${KLEE_BUILD_DIR}/bin/klee-stats --print-all --table-format=csv klee-last/ >> klee_cfm_stats_"$input_size"_"$i".csv 2>&1
            echo "running klee_cfmsm"
            make klee_cfmsm >> klee_cfmsm_"$input_size"_"$i".log 2>&1
            cat klee-last/info >> klee_cfmsm_"$input_size"_"$i".log 2>&1
            ${KLEE_BUILD_DIR}/bin/klee-stats --print-all --table-format=csv klee-last/ >> klee_cfmsm_stats_"$input_size"_"$i".csv 2>&1
        done
    done
    cd ..
}


run_bench "toupper" "10"
run_bench "bitonic_sort" "4"
run_bench "connected_comp" "3"
run_bench "detect_edges" "3"
run_bench "dilation" "4"
run_bench "erosion" "4"
run_bench "floyd_warshall" "3"
run_bench "prim" "3"
run_bench "transitive_closure" "3"
run_bench "kruskal" "3"


# echo "Done" | mail -s "benchmarks run complete!" $USER
