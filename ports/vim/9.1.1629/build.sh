#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make -j"${PKG_JOBS:-1}"
