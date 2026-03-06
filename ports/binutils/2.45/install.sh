#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/build"
make DESTDIR="$PKG_STORE_DIR" tooldir=/usr install
rm -rf "$PKG_STORE_DIR"/usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a \
       "$PKG_STORE_DIR"/usr/share/doc/gprofng/
