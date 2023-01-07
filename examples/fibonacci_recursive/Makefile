LLVM_HOME=~/PLCL/llvm-project-rocm/build
clang=$(LLVM_HOME)/bin/clang
opt=$(LLVM_HOME)/bin/opt
cfmerger_flags=-mem2reg -cfmelder  -S -force-cf-merging 
klee_include=~/PLCL/klee/include/
clang_flags=-I $(klee_include) -emit-llvm -S -Xclang -disable-O0-optnone
file_name=fibonacci_recursive
function_to_analzye_in_cfg=foo

all: $(file_name).c
	${clang} ${clang_flags} $(file_name).c
	${opt} ${cfmerger_flags} < $(file_name).ll > $(file_name).merged.ll

cfgNOCFM: $(file_name).ll
	opt -dot-cfg $(file_name).ll
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

