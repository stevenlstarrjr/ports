#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

./bootstrap --prefix=/usr --parallel="${PKG_JOBS:-1}" -- -DCMAKE_USE_OPENSSL=ON

make -j"${PKG_JOBS:-1}"
