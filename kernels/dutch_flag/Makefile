include ../makefile.in

file_name=df
function_to_analzye_in_cfg=flag

all: $(file_name).c
	${CLANG} ${CLANG_FLAGS} $(file_name).c
	${OPT} -f ${CFMSE_FLAGS} -o $(file_name).ll < $(file_name).ll

merge: $(file_name).c
	${CLANG} ${CLANG_FLAGS} -DMERGE $(file_name).c
	${OPT} -f ${CFMSE_FLAGS} -o $(file_name).ll < $(file_name).ll

cfg: $(file_name).ll
	${OPT} -dot-cfg $(file_name).ll
	dot -Tsvg .$(function_to_analzye_in_cfg).dot -o $(function_to_analzye_in_cfg).svg

klee: $(file_name).ll
	$(KLEE_BIN) $(KLEE_NOCFM_OPTIONS) $(file_name).ll

klee_sm: $(file_name).ll
	$(KLEE_BIN) -use-merge $(KLEE_NOCFM_OPTIONS) $(file_name).ll

klee_cfm: $(file_name).ll
	$(KLEE_BIN) $(KLEE_CFM_OPTIONS) $(file_name).ll

klee_cfmsm: $(file_name).ll
	$(KLEE_BIN) -use-merge $(KLEE_CFM_OPTIONS) $(file_name).ll

include ../makefile.clean