#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
ln -sf flex "$PKG_STORE_DIR/usr/bin/lex"
mkdir -p "$PKG_STORE_DIR/usr/share/man/man1"
ln -sf flex.1 "$PKG_STORE_DIR/usr/share/man/man1/lex.1"
