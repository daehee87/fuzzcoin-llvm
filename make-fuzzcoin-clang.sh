#!/bin/bash
N=`nproc`
if [ $# -gt 0 ]; then
	N="$1"
fi

echo using $N cores...

mkdir build
cd build
cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE="RELEASE" \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    -DLLVM_ENABLE_PROJECTS="compiler-rt;clang" \
    ../llvm

make -j$N
