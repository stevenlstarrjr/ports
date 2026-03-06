#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
mkdir -p "$PKG_STORE_DIR/usr/sbin" "$PKG_STORE_DIR/usr/share/man/man8"
if [[ -e "$PKG_STORE_DIR/usr/bin/chroot" ]]; then
  mv -v "$PKG_STORE_DIR/usr/bin/chroot" "$PKG_STORE_DIR/usr/sbin/chroot"
fi
if [[ -e "$PKG_STORE_DIR/usr/share/man/man1/chroot.1" ]]; then
  mv -v "$PKG_STORE_DIR/usr/share/man/man1/chroot.1" "$PKG_STORE_DIR/usr/share/man/man8/chroot.8"
  sed -i 's/"1"/"8"/' "$PKG_STORE_DIR/usr/share/man/man8/chroot.8"
fi
