#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
git submodule update --init --recursive || true
rm -rf external/spirv-headers
mkdir -p external
git clone --depth 1 https://github.com/KhronosGroup/SPIRV-Headers.git external/spirv-headers
cmake -S . -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=/usr \
  -DSPIRV-Headers_DIR=/usr/share/cmake/SPIRV-Headers \
  -DSPIRV_SKIP_EXECUTABLES=OFF \
  -DSPIRV_WERROR=OFF
cmake --build build -j"${PKG_JOBS:-1}"
