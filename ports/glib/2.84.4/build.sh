#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
meson setup "$PKG_BUILD_DIR" "$PKG_SRC_DIR" \
  --prefix=/usr \
  --buildtype=release \
  -Dtests=false \
  -Dnls=disabled \
  -Dglib_debug=disabled \
  -Dman-pages=disabled \
  -Ddtrace=false \
  -Dsysprof=disabled
ninja -C "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"
