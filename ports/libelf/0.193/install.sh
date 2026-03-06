#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" -C libelf install
mkdir -p "$PKG_STORE_DIR/usr/lib/pkgconfig"
install -m644 config/libelf.pc "$PKG_STORE_DIR/usr/lib/pkgconfig/libelf.pc"
rm -f "$PKG_STORE_DIR/usr/lib/libelf.a"
