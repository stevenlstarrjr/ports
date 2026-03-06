#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic

make -j"${PKG_JOBS:-1}"

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
