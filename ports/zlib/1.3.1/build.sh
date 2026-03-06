#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr

make



rm -fv /usr/lib/libz.a
