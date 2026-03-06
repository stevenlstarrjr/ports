#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
patch -Np1 -i "$PKG_ROOT/ports/bzip2/1.0.8/bzip2-1.0.8-install_docs-1.patch"

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i 's@(PREFIX)/man@(PREFIX)/share/man@g' Makefile

make -f Makefile-libbz2_so
make clean
make -j"${PKG_JOBS:-1}"
