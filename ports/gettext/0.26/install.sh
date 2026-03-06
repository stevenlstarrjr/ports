#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
if [[ -e "$PKG_STORE_DIR/usr/lib/preloadable_libintl.so" ]]; then
  chmod 0755 "$PKG_STORE_DIR/usr/lib/preloadable_libintl.so"
fi
