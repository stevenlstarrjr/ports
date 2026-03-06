#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/pkgconf-2.5.1

make
