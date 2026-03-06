#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
DESTDIR="$PKG_STORE_DIR" cmake --install build

