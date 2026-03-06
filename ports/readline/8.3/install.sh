#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
mkdir -p "$PKG_STORE_DIR/usr/share/doc/readline-8.3"
for ext in ps pdf html dvi; do
  for f in doc/*."$ext"; do
    [[ -e "$f" ]] || continue
    install -m644 "$f" "$PKG_STORE_DIR/usr/share/doc/readline-8.3/"
  done
done
