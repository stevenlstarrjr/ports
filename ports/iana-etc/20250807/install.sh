#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
mkdir -p "$PKG_STORE_DIR/etc"
install -m 644 services "$PKG_STORE_DIR/etc/services"
install -m 644 protocols "$PKG_STORE_DIR/etc/protocols"
