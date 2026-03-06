#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
cmake -S "$PKG_SRC_DIR" -B "$PKG_BUILD_DIR" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DENABLE_SHARED=ON \
  -DENABLE_STATIC=OFF \
  -DWITH_JAVA=OFF
cmake --build "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"

