#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
ln -sf pkgconf "$PKG_STORE_DIR/usr/bin/pkg-config"
mkdir -p "$PKG_STORE_DIR/usr/share/man/man1"
ln -sf pkgconf.1 "$PKG_STORE_DIR/usr/share/man/man1/pkg-config.1"
