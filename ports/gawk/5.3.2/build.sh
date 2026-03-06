#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make -j"${PKG_JOBS:-1}"
