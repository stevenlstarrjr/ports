#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
if [[ -e "$PKG_STORE_DIR/etc/bash_completion.d/grub" ]]; then
  mkdir -p "$PKG_STORE_DIR/usr/share/bash-completion/completions"
  mv -v "$PKG_STORE_DIR/etc/bash_completion.d/grub" \
        "$PKG_STORE_DIR/usr/share/bash-completion/completions/grub"
fi
