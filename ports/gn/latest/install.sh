#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
install -Dm755 out/gn "$PKG_STORE_DIR/usr/bin/gn"

