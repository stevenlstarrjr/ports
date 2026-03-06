#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.3

make


