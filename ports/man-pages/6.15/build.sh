#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
shopt -s nullglob
crypt_pages=(man3/crypt*)
if ((${#crypt_pages[@]})); then
  rm -v "${crypt_pages[@]}"
else
  echo "[info] no man3/crypt* files to remove"
fi
shopt -u nullglob

