#!/bin/bash 
source ./run-bench-common.sh

run_bench "erosion" "4 5 6" "5" "klee_cfm"
run_bench "erosion" "4 5 6" "5" "klee_sm"
run_bench "erosion" "4 5 6" "5" "klee_cfmsm"
run_bench "erosion" "4 5 6" "1" "klee"

echo "Done" | mail -s "erosion run complete!" $USER
