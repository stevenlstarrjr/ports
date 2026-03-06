#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
meson setup build \
  --prefix=/usr \
  --buildtype=release \
  -Dintel=enabled \
  -Damdgpu=enabled \
  -Dradeon=enabled \
  -Dnouveau=disabled
ninja -C build -j"${PKG_JOBS:-1}"
