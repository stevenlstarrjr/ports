#!/usr/bin/env bash
set -euo pipefail
mkdir -p "$PKG_STORE_DIR/usr/share/hwdata"
install -m 0644 "$PKG_SRC_DIR/pnp.ids" "$PKG_STORE_DIR/usr/share/hwdata/pnp.ids"

