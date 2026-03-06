#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.18.1

make -j"${PKG_JOBS:-1}"
