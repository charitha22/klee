LLVM_HOME=~/PLCL/llvm-project-rocm/build
clang=$(LLVM_HOME)/bin/clang
opt=$(LLVM_HOME)/bin/opt
cfmerger_flags=-mem2reg -cfmelder-codesize -S -force-cf-merging 
klee_include=~/PLCL/klee/include/
clang_flags=-I $(klee_include) -g -emit-llvm -S -Xclang -disable-O0-optnone
file_name=diamond_inside_loop
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
	klee --only-output-states-covering-new --write-cov $(file_name).ll

klee: $(file_name).merged.ll
	klee --only-output-states-covering-new --write-cov $(file_name).merged.ll

clean:
	rm  -rf *.ll output*.* .*.dot klee-out-*/ klee-last *.svg

