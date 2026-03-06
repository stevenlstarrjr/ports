#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
patch -Np1 -i "$PKG_ROOT/ports/kbd/2.8.0/kbd-2.8.0-backspace-1.patch"

sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

./configure --prefix=/usr --disable-vlock
make -j"${PKG_JOBS:-1}"
