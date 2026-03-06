#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib
