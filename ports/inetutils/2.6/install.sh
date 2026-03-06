#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
if [[ -e "$PKG_STORE_DIR/usr/bin/ifconfig" ]]; then
  mkdir -p "$PKG_STORE_DIR/usr/sbin"
  mv -v "$PKG_STORE_DIR/usr/bin/ifconfig" "$PKG_STORE_DIR/usr/sbin/ifconfig"
fi
