#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
ln -sf expect5.45.4/libexpect5.45.4.so "$PKG_STORE_DIR/usr/lib/libexpect5.45.4.so"
