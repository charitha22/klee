# FIXME : assumes LLVM and KLEE directories are at same level
export KLEE_BUILD_DIR=$(realpath .)/../klee/build
export LLVM_BUILD_DIR=$(realpath .)/../llvm-project-rocm/build_cfmse

# directory of klee, stp, klee-uclibs, minisat (assuming they are in the same directory)
export TOOLS_DIR=$(realpath .)/../
