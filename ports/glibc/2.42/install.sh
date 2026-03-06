#!/usr/bin/env bash
set -euo pipefail

# Store-mode staged install from out-of-tree build dir.
cd "$PKG_SRC_DIR/build"
make install_root="$PKG_STORE_DIR" install
