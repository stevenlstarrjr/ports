#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make BUILD_STATIC=no PREFIX=/usr

make -j1 check

