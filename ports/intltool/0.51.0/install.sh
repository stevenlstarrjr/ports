#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
install -Dm644 doc/I18N-HOWTO "$PKG_STORE_DIR/usr/share/doc/intltool-0.51.0/I18N-HOWTO"
