#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat

make -j"${PKG_JOBS:-1}"


