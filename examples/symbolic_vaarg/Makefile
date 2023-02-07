include ../makefile.in
file_name=symbolic_vaarg

all: $(file_name).c
	${CLANG} ${CLANG_FLAGS} $(file_name).c
	${OPT} ${CFMSE_FLAGS} -cfmse-analysis-only < $(file_name).ll > $(file_name).merged.ll

include ../makefile.clean
