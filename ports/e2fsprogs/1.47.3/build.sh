#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
mkdir -v build
cd       build

../configure --prefix=/usr       \
             --sysconfdir=/etc   \
             --enable-elf-shlibs \
             --disable-libblkid  \
             --disable-libuuid   \
             --disable-uuidd     \
             --disable-fsck

make -j"${PKG_JOBS:-1}"
make docs
