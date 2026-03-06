#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
install -Dm755 ninja "$PKG_STORE_DIR/usr/bin/ninja"
install -Dm644 misc/bash-completion "$PKG_STORE_DIR/usr/share/bash-completion/completions/ninja"
install -Dm644 misc/zsh-completion "$PKG_STORE_DIR/usr/share/zsh/site-functions/_ninja"
