#!/bin/bash 
source ./run-bench-common.sh

run_bench "bitonic_sort" "4 8 16" "5" "klee_cfm"
run_bench "bitonic_sort" "4 8 16" "5" "klee_sm"
run_bench "bitonic_sort" "4 8 16" "5" "klee_cfmsm"
run_bench "bitonic_sort" "4 8 16" "3" "klee"

echo "Done" | mail -s "bitonic_sort run complete!" $USER
