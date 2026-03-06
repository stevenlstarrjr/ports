#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" prefix=/usr install
rm -fv "$PKG_STORE_DIR/usr/lib/libzstd.a"
