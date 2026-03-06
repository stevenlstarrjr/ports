#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
python3 -c 'from pty import spawn; spawn(["echo", "ok"])'

patch -Np1 -i "$PKG_ROOT/ports/expect/5.45.4/expect-5.45.4-gcc15-1.patch"

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --disable-rpath         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include

make -j"${PKG_JOBS:-1}"
