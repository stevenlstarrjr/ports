#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
meson setup "$PKG_BUILD_DIR" "$PKG_SRC_DIR" \
  --prefix=/usr \
  --buildtype=release \
  -Ddoc=disabled \
  -Dnls=disabled \
  -Dtests=disabled
ninja -C "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"

