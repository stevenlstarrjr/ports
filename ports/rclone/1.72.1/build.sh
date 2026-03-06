#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

src_root=
for candidate in "$PKG_SRC_DIR" "$PKG_SRC_DIR"/*; do
  if [[ -f "$candidate/go.mod" && -f "$candidate/rclone.go" ]]; then
    src_root="$candidate"
    break
  fi
done

if [[ -z "$src_root" ]]; then
  echo "missing extracted rclone source under $PKG_SRC_DIR" >&2
  exit 1
fi

rm -rf "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR"

cd "$src_root"
if [[ -f /usr/ports/ca-certificates.crt ]]; then
  export SSL_CERT_FILE=/usr/ports/ca-certificates.crt
  export GIT_SSL_CAINFO=/usr/ports/ca-certificates.crt
fi

CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o "$PKG_BUILD_DIR/rclone" .
