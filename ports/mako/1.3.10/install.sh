#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
wheel="$(find dist -maxdepth 1 -type f -name '*.whl' | head -n 1)"
if [[ -z "$wheel" ]]; then
  echo "mako wheel not found in dist/" >&2
  exit 1
fi
pip3 install --no-deps --ignore-installed --no-warn-script-location --root "$PKG_STORE_DIR" --prefix /usr "$wheel"
