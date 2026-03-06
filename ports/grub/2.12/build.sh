#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
unset {C,CPP,CXX,LD}FLAGS

echo depends bli part_gpt > grub-core/extra_deps.lst

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-efiemu  \
            --disable-werror

make -j"${PKG_JOBS:-1}"
