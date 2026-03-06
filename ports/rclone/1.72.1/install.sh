#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$PKG_STORE_DIR/usr/bin"
install -m 755 "$PKG_BUILD_DIR/rclone" "$PKG_STORE_DIR/usr/bin/rclone"
