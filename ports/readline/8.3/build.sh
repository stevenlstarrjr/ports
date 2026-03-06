#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.3

make -j"${PKG_JOBS:-1}" SHLIB_LIBS="-lncursesw"
