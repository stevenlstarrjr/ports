#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/build"
DESTDIR="$PKG_STORE_DIR" ninja install
mkdir -p "$PKG_STORE_DIR/var/lib"
ln -sf /etc/machine-id "$PKG_STORE_DIR/var/lib/dbus"
