#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
git submodule update --init --recursive || true
cmake -S . -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DENABLE_GLSLANG_BINARIES=ON \
  -DENABLE_HLSL=ON \
  -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
  -DCMAKE_PREFIX_PATH=/usr
cmake --build build -j"${PKG_JOBS:-1}"
