#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
make -C doc install-html DESTDIR="$PKG_STORE_DIR" docdir=/usr/share/doc/tar-1.35
