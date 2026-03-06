#!/usr/bin/env bash
set -euo pipefail
install -d "$PKG_STORE_DIR/usr/include"
install -m 0644 "$PKG_SRC_DIR/include/vk_mem_alloc.h" "$PKG_STORE_DIR/usr/include/vk_mem_alloc.h"
