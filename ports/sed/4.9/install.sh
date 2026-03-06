#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
install -d -m755 "$PKG_STORE_DIR/usr/share/doc/sed-4.9"
install -m644 doc/sed.html "$PKG_STORE_DIR/usr/share/doc/sed-4.9"
