#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i "s/echo/#echo/" src/egrep.sh

./configure --prefix=/usr

make


