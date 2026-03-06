#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
mkdir -p build
cd       build

meson setup --prefix=/usr ..    \
            --buildtype=release \
            -D manpages=false

ninja
