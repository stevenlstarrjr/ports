#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
mkdir -p "$PKG_STORE_DIR/usr/share/doc"
cp -r --no-preserve=ownership docs/doc "$PKG_STORE_DIR/usr/share/doc/kbd-2.8.0"
