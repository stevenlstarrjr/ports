#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
rm -rf build-meson
meson setup build-meson
meson compile -C build-meson
