#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
cmake -S "$PKG_SRC_DIR" -B "$PKG_BUILD_DIR" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DPCRE2_BUILD_TESTS=OFF
cmake --build "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"

