#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"

install -d "$PKG_STORE_DIR/usr/bin"
install -m755 toybox "$PKG_STORE_DIR/usr/bin/toybox"

while read -r applet; do
  [[ -n "$applet" ]] || continue
  ln -sf toybox "$PKG_STORE_DIR/usr/bin/$applet"
done < <("$PKG_STORE_DIR/usr/bin/toybox")
