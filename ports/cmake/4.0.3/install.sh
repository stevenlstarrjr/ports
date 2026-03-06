#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

make DESTDIR="$PKG_STORE_DIR" install
