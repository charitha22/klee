include ../makefile.in
file_name=diamond_inside_loop

all: $(file_name).c
	${CLANG} ${CLANG_FLAGS} $(file_name).c
	${OPT} ${CFMSE_FLAGS} < $(file_name).ll > $(file_name).merged.ll

kleeNOCFM: $(file_name).ll
	${KLEE} $(file_name).ll

klee: $(file_name).merged.ll
	${KLEE} $(file_name).merged.ll

clean:
	rm  -rf *.ll output*.* .*.dot klee-out-*/ klee-last

