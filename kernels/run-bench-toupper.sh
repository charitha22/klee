#!/bin/bash 
source ./run-bench-common.sh


# run_bench "toupper" "10 50 100" "5" "klee_cfm_verify"
# run_bench "toupper" "10 50 100" "5" "klee_sm_verify"
run_bench "toupper" "10 50 100" "5" "klee_cfmsm_verify"
# run_bench "toupper" "10 50 100" "1" "klee_verify"

echo "Done" | mail -s "toupper run complete!" $USER
