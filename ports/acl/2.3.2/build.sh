#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

./configure --prefix=/usr \
            --disable-static \
            --docdir=/usr/share/doc/acl-2.3.2

make -j"${PKG_JOBS:-1}"
