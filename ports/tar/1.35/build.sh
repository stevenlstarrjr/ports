#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr

make -j"${PKG_JOBS:-1}"
