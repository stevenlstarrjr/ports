#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.5 \
            --disable-static                        \
            --disable-kill                          \
            --enable-watch8bit                      \
            --with-systemd

make -j"${PKG_JOBS:-1}"
