#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/unix"
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --disable-rpath

make -j"${PKG_JOBS:-1}"
