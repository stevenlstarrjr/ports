#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -p build
cd build

../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --enable-host-pie        \
             --disable-nls            \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-fixincludes    \
             --with-system-zlib

gcc_jobs="${PKG_JOBS:-1}"
if [[ "${gcc_jobs}" -gt 2 ]]; then
  gcc_jobs=2
fi
make -j"${gcc_jobs}"

ulimit -s -H unlimited || true
sed -e '/cpython/d' -i ../gcc/testsuite/gcc.dg/plugin/plugin.exp || true
