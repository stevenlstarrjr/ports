#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
cmake -S . -B build \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_DIR=/usr/lib/cmake/llvm \
  -DCMAKE_PREFIX_PATH=/usr \
  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include
ninja -C build -j"${PKG_JOBS:-1}"
