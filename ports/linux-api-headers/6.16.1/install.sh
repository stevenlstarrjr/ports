#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
make headers
find usr/include -type f ! -name '*.h' -delete
mkdir -p "$PKG_STORE_DIR/usr"
cp -rv usr/include "$PKG_STORE_DIR/usr/"
