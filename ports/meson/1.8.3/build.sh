#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
