#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
./configure \
  --prefix=/usr \
  --disable-static \
  --disable-docs \
  --disable-manual \
  --without-libpsl \
  --without-libidn2 \
  --with-openssl \
  --with-ca-bundle=/usr/ports/ca-certificates.crt \
  --with-ca-path=/etc/ssl/certs

make -j"${PKG_JOBS:-1}"
