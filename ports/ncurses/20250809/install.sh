#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

make DESTDIR="$PKG_STORE_DIR" install

# Adjust staged headers/links/docs for the wide-char build.
sed -e 's/^#if.*XOPEN.*$/#if 1/' -i "$PKG_STORE_DIR/usr/include/curses.h"

for lib in ncurses form panel menu; do
  ln -sfv "lib${lib}w.so" "$PKG_STORE_DIR/usr/lib/lib${lib}.so"
  ln -sfv "${lib}w.pc" "$PKG_STORE_DIR/usr/lib/pkgconfig/${lib}.pc"
done
ln -sfv libncursesw.so "$PKG_STORE_DIR/usr/lib/libcurses.so"
mkdir -p "$PKG_STORE_DIR/usr/share/doc"
cp -r --no-preserve=ownership doc "$PKG_STORE_DIR/usr/share/doc/ncurses-6.5-20250809"

# Build and stage ABI 5 compatibility shared libs.
make distclean
./configure --prefix=/usr \
            --with-shared \
            --without-normal \
            --without-debug \
            --without-cxx-binding \
            --with-abi-version=5
make -j"${PKG_JOBS:-1}" sources libs
cp -r --no-preserve=ownership lib/lib*.so.5* "$PKG_STORE_DIR/usr/lib/"
