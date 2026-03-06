#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
meson setup build --prefix=/usr --buildtype=release -Ddocumentation=false
ninja -C build -j"${PKG_JOBS:-1}"
