#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
cp -av "$PKG_BUILD_DIR/libxcrypt-modern"/libcrypt.so.2* "$PKG_STORE_DIR/usr/lib"/
