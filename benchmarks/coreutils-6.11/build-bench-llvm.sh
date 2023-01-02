export LLVM_COMPILER=clang
# -g flag removed because we are not updating debug info
# CFLAGS="-g -O1 -Xclang -disable-llvm-passes -D__NO_STRING_INLINES  -D_FORTIFY_SOURCE=0 -U__OPTIMIZE__"
C_FLAGS="-O1 -Xclang -disable-llvm-passes -D__NO_STRING_INLINES  -D_FORTIFY_SOURCE=0 -U__OPTIMIZE__"

mkdir -p obj-llvm
cd obj-llvm

# CC=wllvm ../configure --disable-nls CFLAGS="-g -O1 -Xclang -disable-llvm-passes -D__NO_STRING_INLINES  -D_FORTIFY_SOURCE=0 -U__OPTIMIZE__"
CC=wllvm ../configure --disable-nls CFLAGS="${C_FLAGS}"
make
make -C src arch hostname

find . -executable -type f | xargs -I '{}' extract-bc '{}'

cd ..