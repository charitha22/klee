<<<<<<< HEAD
LLVM_HOME=~/PLCL/llvm-project-rocm/build
clang=$(LLVM_HOME)/bin/clang
opt=$(LLVM_HOME)/bin/opt
cfmerger_flags=-mem2reg -cfmelder-codesize -S -force-cf-merging 
klee_include=~/PLCL/klee/include/
clang_flags=-I $(klee_include) -emit-llvm -S -Xclang -disable-O0-optnone
file_name=function_call
function_to_analzye_in_cfg=foo

all: $(file_name).c
	${clang} ${clang_flags} $(file_name).c
	${opt} ${cfmerger_flags} < $(file_name).ll > $(file_name).merged.ll

hello: $(file_name).merged.ll
	~/PLCL/llvm-project-rocm/build/bin/opt -enable-new-pm=0 -load ~/PLCL/llvm-project-rocm/build/lib/LLVMHello.so -hello < $(file_name).merged.ll > /dev/null

cfgNOCFM: $(file_name).ll
	opt -mem2reg -dot-cfg $(file_name).ll
	dot -Tsvg .$(function_to_analzye_in_cfg).dot -o $(function_to_analzye_in_cfg).svg

cfg: $(file_name).merged.ll
	opt -dot-cfg $(file_name).merged.ll
	dot -Tsvg .$(function_to_analzye_in_cfg).dot -o $(function_to_analzye_in_cfg)_merged.svg

kleeNOCFM: $(file_name).ll
	klee $(file_name).ll

klee: $(file_name).merged.ll
	klee $(file_name).merged.ll

clean:
	rm  -rf *.ll output*.* .*.dot klee-out-*/ klee-last *.svg
=======
include ../makefile.in
file_name=function_call

all: $(file_name).c
	${CLANG} ${CLANG_FLAGS} $(file_name).c
	${OPT} ${CFMSE_FLAGS} -cfmse-analysis-only < $(file_name).ll > $(file_name).merged.ll

clean:
	rm  -rf *.ll output*.* .*.dot klee-out-*/ klee-last
>>>>>>> 70d143f04289df06137f075c9b109490e1244814

