#!/usr/bin/env bash
set -euo pipefail
sed -i 's/LLVMCreateDenormalFPEnvAttribute(ctx,/LLVMCreateDenormalFPEnvAttribute(ctx->context,/' \
  "$PKG_SRC_DIR/src/amd/llvm/ac_llvm_build.c"
rm -rf "$PKG_BUILD_DIR"
meson setup "$PKG_BUILD_DIR" "$PKG_SRC_DIR" \
  --prefix=/usr \
  --buildtype=release \
  -D cpp_rtti=false \
  -D platforms=wayland \
  -D glx=disabled \
  -D gallium-drivers=auto \
  -D gallium-rusticl=false \
  -D mesa-clc=enabled \
  -D vulkan-drivers=intel,amd
ninja -C "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"
