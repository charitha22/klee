LLVM_HOME=~/PLCL/llvm-project-rocm/build/
clang=$(LLVM_HOME)/bin/clang
opt=$(LLVM_HOME)/bin/opt
cfmerger_flags=-mem2reg -cfmelder  -S -force-cf-merging 
klee_include=~/PLCL/klee/include/
clang_flags=-I $(klee_include) -emit-llvm -S -Xclang -disable-O0-optnone
file_name=array_loop_with_if_else

all: $(file_name).c
	${clang} ${clang_flags} $(file_name).c
	${opt} ${cfmerger_flags} < $(file_name).ll > $(file_name).merged.ll

kleeNOCFM: $(file_name).ll
	klee $(file_name).ll

klee: $(file_name).merged.ll
	klee $(file_name).merged.ll

clean:
	rm  -rf *.ll output*.* .*.dot klee-out-*/ klee-last

