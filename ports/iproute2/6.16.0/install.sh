#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" SBINDIR=/usr/sbin install
mkdir -p "$PKG_STORE_DIR/usr/share/doc/iproute2-6.16.0"
install -m644 COPYING README* "$PKG_STORE_DIR/usr/share/doc/iproute2-6.16.0/"
