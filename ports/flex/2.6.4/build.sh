#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

make -j"${PKG_JOBS:-1}"
