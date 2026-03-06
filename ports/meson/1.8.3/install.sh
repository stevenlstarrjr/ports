#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
wheel="$(echo dist/meson-*.whl)"
pip3 install --no-deps --ignore-installed --no-warn-script-location --root "$PKG_STORE_DIR" --prefix /usr "$wheel"
install -Dm644 data/shell-completions/bash/meson \
  "$PKG_STORE_DIR/usr/share/bash-completion/completions/meson"
install -Dm644 data/shell-completions/zsh/_meson \
  "$PKG_STORE_DIR/usr/share/zsh/site-functions/_meson"
