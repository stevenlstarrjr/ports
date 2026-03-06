#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" exec_prefix=/usr install
make DESTDIR="$PKG_STORE_DIR" -C man install-man

# Package-mode note: runtime account database changes are not performed here.
mkdir -p "$PKG_STORE_DIR/share/pkg-notes"
cat > "$PKG_STORE_DIR/share/pkg-notes/shadow-postinstall.txt" <<NOTE
The original LFS sequence also ran:
- pwconv
- grpconv
- useradd -D --gid 999
- edits under /etc/default/useradd
- passwd root

Those are host/system activation steps and must not run during package build.
NOTE
