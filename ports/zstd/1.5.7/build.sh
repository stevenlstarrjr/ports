#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make -j"${PKG_JOBS:-1}" prefix=/usr
