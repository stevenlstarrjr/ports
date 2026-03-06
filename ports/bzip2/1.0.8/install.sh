#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" PREFIX=/usr install

mkdir -p "$PKG_STORE_DIR/usr/lib" "$PKG_STORE_DIR/usr/bin"
cp -r --no-preserve=ownership libbz2.so.* "$PKG_STORE_DIR/usr/lib/"
ln -sfv libbz2.so.1.0.8 "$PKG_STORE_DIR/usr/lib/libbz2.so"
cp -v bzip2-shared "$PKG_STORE_DIR/usr/bin/bzip2"
for i in "$PKG_STORE_DIR"/usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 "$i"
done
rm -fv "$PKG_STORE_DIR/usr/lib/libbz2.a"
