#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR"
cd "$PKG_BUILD_DIR"
"$PKG_SRC_DIR"/configure --bindir=/usr/bin     \
            --libdir=/usr/lib     \
            --runstatedir=/run    \
            --sbindir=/usr/sbin   \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-liblastlog2 \
            --disable-static      \
            --without-python      \
            ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --docdir=/usr/share/doc/util-linux-2.41.1

make -j"${PKG_JOBS:-1}"
