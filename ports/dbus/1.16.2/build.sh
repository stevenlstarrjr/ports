#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..

ninja
