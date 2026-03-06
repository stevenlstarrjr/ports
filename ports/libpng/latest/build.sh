#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
cmake -S "$PKG_SRC_DIR" -B "$PKG_BUILD_DIR" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DPNG_TESTS=OFF \
  -DPNG_SHARED=ON \
  -DPNG_STATIC=OFF
cmake --build "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"

