#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
patch -Np1 -i "$PKG_ROOT/ports/coreutils/9.7/coreutils-9.7-upstream_fix-1.patch"

patch -Np1 -i "$PKG_ROOT/ports/coreutils/9.7/coreutils-9.7-i18n-1.patch"

autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make -j"${PKG_JOBS:-1}"
