#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" MANSUFFIX=ssl install
mkdir -p "$PKG_STORE_DIR/usr/share/doc/openssl-3.5.2"
cp -r --no-preserve=ownership doc/. "$PKG_STORE_DIR/usr/share/doc/openssl-3.5.2/"
