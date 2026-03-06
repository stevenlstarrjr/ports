#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_BUILD_DIR"
make DESTDIR="$PKG_STORE_DIR" install

