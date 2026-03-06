#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --enable-new-dtags  \
             --with-system-zlib  \
             --enable-default-hash-style=gnu

make -j"${PKG_JOBS:-1}" tooldir=/usr
