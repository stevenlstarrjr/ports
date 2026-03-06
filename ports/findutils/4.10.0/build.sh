#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr --localstatedir=/var/lib/locate

make -j"${PKG_JOBS:-1}"
