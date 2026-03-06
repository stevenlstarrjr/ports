#!/usr/bin/env bash
set -euo pipefail
DESTDIR="$PKG_STORE_DIR" cmake --install "$PKG_BUILD_DIR"
