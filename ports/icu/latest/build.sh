#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR"
cd "$PKG_BUILD_DIR"
"$PKG_SRC_DIR"/icu4c/source/configure \
  --prefix=/usr \
  --disable-static \
  --enable-shared
make -j"${PKG_JOBS:-1}"

