#!/usr/bin/env bash
set -euo pipefail
DESTDIR="$PKG_STORE_DIR" ninja -C "$PKG_BUILD_DIR" install

