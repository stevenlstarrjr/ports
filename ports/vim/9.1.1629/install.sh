#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
ln -sf vim "$PKG_STORE_DIR/usr/bin/vi"
mkdir -p "$PKG_STORE_DIR/usr/share/man/man1" "$PKG_STORE_DIR/usr/share/doc"
for L in "$PKG_STORE_DIR"/usr/share/man/man1/vim.1 "$PKG_STORE_DIR"/usr/share/man/*/man1/vim.1; do
  [[ -e "$L" ]] || continue
  ln -sf vim.1 "$(dirname "$L")/vi.1"
done
ln -sf ../vim/vim91/doc "$PKG_STORE_DIR/usr/share/doc/vim-9.1.1629"
mkdir -p "$PKG_STORE_DIR/etc"
cat > "$PKG_STORE_DIR/etc/vimrc" <<'EOF'
" Begin /etc/vimrc
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1
set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif
" End /etc/vimrc
EOF
