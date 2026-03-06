#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make defconfig
make -j"${PKG_JOBS:-1}" toybox
