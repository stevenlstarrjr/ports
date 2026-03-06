#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
if [ ! -x configure ] && [ -x autogen.sh ]; then
  NOCONFIGURE=1 ./autogen.sh
fi
./configure --prefix=/usr
make -j"${PKG_JOBS:-1}"

