#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
cmake -S libclc -B build \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_CONFIG=/usr/bin/llvm-config \
  -DCLANG=/usr/bin/clang \
  -DLIBCLC_TARGETS_TO_BUILD="amdgcn--;spirv-mesa3d-;spirv64-mesa3d-" \
  -DLLVM_SPIRV=/usr/bin/llvm-spirv \
  -DSPIRV_HEADERS_INCLUDE_DIR=/usr/include \
  -DSPIRV_TOOLS_INCLUDE_DIR=/usr/include \
  -DSPIRV_TOOLS_LIBRARY_DIR=/usr/lib
ninja -C build -j"${PKG_JOBS:-1}"
