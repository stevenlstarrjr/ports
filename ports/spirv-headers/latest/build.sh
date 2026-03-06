#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
cmake --build build -j"${PKG_JOBS:-1}"
