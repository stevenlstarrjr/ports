#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

payload_dir=
for candidate in "$PKG_SRC_DIR" "$PKG_SRC_DIR"/go "$PKG_SRC_DIR"/* "$PKG_SRC_DIR"/*/go; do
  if [[ -x "$candidate/bin/go" ]]; then
    payload_dir="$candidate"
    break
  fi
done

if [[ -z "${payload_dir}" ]]; then
  echo "missing extracted go payload under $PKG_SRC_DIR" >&2
  exit 1
fi

mkdir -p "$PKG_STORE_DIR/usr/lib" "$PKG_STORE_DIR/usr/bin"
rm -rf "$PKG_STORE_DIR/usr/lib/go"
mkdir -p "$PKG_STORE_DIR/usr/lib/go"
cp -a "$payload_dir"/. "$PKG_STORE_DIR/usr/lib/go/"

ln -sfn ../lib/go/bin/go "$PKG_STORE_DIR/usr/bin/go"
ln -sfn ../lib/go/bin/gofmt "$PKG_STORE_DIR/usr/bin/gofmt"
