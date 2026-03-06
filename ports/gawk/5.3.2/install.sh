#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
rm -f "$PKG_STORE_DIR/usr/bin/gawk-5.3.2"
mkdir -p "$PKG_STORE_DIR/usr/share/man/man1" "$PKG_STORE_DIR/usr/share/doc/gawk-5.3.2"
ln -sf gawk.1 "$PKG_STORE_DIR/usr/share/man/man1/awk.1"
install -m644 doc/awkforai.txt "$PKG_STORE_DIR/usr/share/doc/gawk-5.3.2/"
for ext in eps pdf jpg; do
  for f in doc/*."$ext"; do
    [[ -e "$f" ]] || continue
    install -m644 "$f" "$PKG_STORE_DIR/usr/share/doc/gawk-5.3.2/"
  done
done
