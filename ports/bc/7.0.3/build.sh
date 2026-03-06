#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
CC='gcc -std=c99' ./configure --prefix=/usr -G -O3 -r

make -j"${PKG_JOBS:-1}"
