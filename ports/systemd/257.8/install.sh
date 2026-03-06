#!/usr/bin/env bash
set -euo pipefail
DESTDIR="$PKG_STORE_DIR" ninja -C "$PKG_BUILD_DIR" install
systemd_manpages_tar="$PKG_SRC_DIR/systemd-man-pages-257.8.tar.xz"
if [[ -f "$systemd_manpages_tar" ]]; then
  mkdir -p "$PKG_STORE_DIR/usr/share/man"
  tar -xf "$systemd_manpages_tar" \
      --no-same-owner --strip-components=1 \
      -C "$PKG_STORE_DIR/usr/share/man"
fi
