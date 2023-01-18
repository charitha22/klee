include ../makefile.in

file_name=cpp_example
function_to_analzye_in_cfg=main

all: $(file_name).cpp
	${CLANG_CPP} ${CLANG_FLAGS} $(file_name).cpp

default: $(file_name).cpp
	${CLANG_CPP} -I $(KLEE_INCLUDE) -g -disable-O0-optnone $(file_name).cpp

hello: $(file_name).ll
	$(OPT) -enable-new-pm=0 -load ~/PLCL/llvm-project-rocm/build/lib/LLVMHello.so -hello < $(file_name).ll > /dev/null

cfg: $(file_name).ll
	${OPT} -dot-cfg $(file_name).ll
	dot -Tsvg .$(function_to_analzye_in_cfg).dot -o $(function_to_analzye_in_cfg).svg

kleeNOCFM: $(file_name).ll
	$(KLEE_BIN) --libc=uclibc --posix-runtime --debug-dump-stp-queries --only-output-states-covering-new --write-cov $(file_name).ll

klee: $(file_name).ll
	$(KLEE_BIN) --debug-dump-stp-queries --cfmse --only-output-states-covering-new --write-cov $(file_name).ll

clean:
	rm  -rf *.ll output*.* *.dot klee-out-*/ klee-last *.svg *.out

