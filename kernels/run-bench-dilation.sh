#!/bin/bash 
source ./run-bench-common.sh

run_bench "dilation" "4 5 6" "5" "klee_cfm"
run_bench "dilation" "4 5 6" "5" "klee_sm"
run_bench "dilation" "4 5 6" "5" "klee_cfmsm"
run_bench "dilation" "4 5 6" "1" "klee"

echo "Done" | mail -s "dilation run complete!" $USER
