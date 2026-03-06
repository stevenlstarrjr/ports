#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
PAGE="${PAGE:-letter}" ./configure --prefix=/usr

make -j"${PKG_JOBS:-1}"


