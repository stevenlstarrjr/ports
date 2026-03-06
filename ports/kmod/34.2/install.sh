#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/build"
DESTDIR="$PKG_STORE_DIR" ninja install
