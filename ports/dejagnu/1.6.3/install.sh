#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/build"
make DESTDIR="$PKG_STORE_DIR" install
mkdir -p "$PKG_STORE_DIR/usr/share/doc/dejagnu-1.6.3"
install -m644 doc/dejagnu.{html,txt} "$PKG_STORE_DIR/usr/share/doc/dejagnu-1.6.3"
