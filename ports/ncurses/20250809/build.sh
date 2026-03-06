#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

./configure --prefix=/usr \
            --mandir=/usr/share/man \
            --with-shared \
            --without-debug \
            --without-normal \
            --with-cxx-shared \
            --enable-pc-files \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make -j"${PKG_JOBS:-1}"
