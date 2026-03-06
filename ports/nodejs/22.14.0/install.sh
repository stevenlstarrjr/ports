#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

payload_dir=
for candidate in "$PKG_SRC_DIR" "$PKG_SRC_DIR"/*; do
  if [[ -x "$candidate/bin/node" ]]; then
    payload_dir="$candidate"
    break
  fi
done

if [[ -z "$payload_dir" ]]; then
  echo "missing extracted nodejs payload under $PKG_SRC_DIR" >&2
  exit 1
fi

install_root="$PKG_STORE_DIR/usr/lib/nodejs/node-v22.14.0"
mkdir -p "$PKG_STORE_DIR/usr/lib/nodejs" "$PKG_STORE_DIR/usr/bin"
rm -rf "$install_root"
cp -a "$payload_dir" "$install_root"

ln -sfn ../lib/nodejs/node-v22.14.0/bin/node "$PKG_STORE_DIR/usr/bin/node"
ln -sfn ../lib/nodejs/node-v22.14.0/bin/npm "$PKG_STORE_DIR/usr/bin/npm"
ln -sfn ../lib/nodejs/node-v22.14.0/bin/npx "$PKG_STORE_DIR/usr/bin/npx"
