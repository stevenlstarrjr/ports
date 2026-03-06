#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2

make -j"${PKG_JOBS:-1}"


