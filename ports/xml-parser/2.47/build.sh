#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
perl Makefile.PL

make -j"${PKG_JOBS:-1}"
