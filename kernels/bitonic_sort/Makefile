include ../makefile.in

file_name=bitonic_sort
function_to_analzye_in_cfg=merge_down

all : nosm sm

nosm: $(file_name).c
	${CLANG} ${CLANG_FLAGS} -DSIZE=$(SIZE) $(file_name).c 
	${OPT} -f ${CFMSE_FLAGS} -o $(file_name)_nosm.ll < $(file_name).ll

sm: $(file_name).c
	${CLANG} ${CLANG_FLAGS} -DSIZE=$(SIZE) -DMERGE $(file_name).c 
	${OPT} -f ${CFMSE_FLAGS} -o $(file_name)_sm.ll < $(file_name).ll

cfg: $(file_name).ll
	${OPT} -dot-cfg $(file_name).ll
	dot -Tsvg .$(function_to_analzye_in_cfg).dot -o $(function_to_analzye_in_cfg).svg

klee: $(file_name)_nosm.ll
	time $(KLEE_BIN) $(KLEE_NOCFM_OPTIONS) $(file_name)_nosm.ll

klee_sm: $(file_name)_sm.ll
	time $(KLEE_BIN) -use-merge $(KLEE_NOCFM_OPTIONS) $(file_name)_sm.ll

klee_cfm: $(file_name)_nosm.ll
	time $(KLEE_BIN) $(KLEE_CFM_OPTIONS) --klee-cfmse-run-only-on-loops=false --klee-cfmse-loads-symbolic $(file_name)_nosm.ll

klee_cfmsm: $(file_name)_sm.ll
	time $(KLEE_BIN) -use-merge $(KLEE_CFM_OPTIONS) --klee-cfmse-run-only-on-loops=false --klee-cfmse-loads-symbolic $(file_name)_sm.ll

include ../makefile.clean
