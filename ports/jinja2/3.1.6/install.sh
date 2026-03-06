#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
wheel="$(echo dist/jinja2-*.whl)"
pip3 install --no-deps --ignore-installed --no-warn-script-location --root "$PKG_STORE_DIR" --prefix /usr "$wheel"
