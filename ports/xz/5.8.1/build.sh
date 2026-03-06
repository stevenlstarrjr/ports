#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
./configure --prefix=/usr \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.8.1

make -j"${PKG_JOBS:-1}"

