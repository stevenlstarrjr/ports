#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
install -d "$PKG_STORE_DIR/usr/include/skia/include" "$PKG_STORE_DIR/usr/lib"
cp -a include/. "$PKG_STORE_DIR/usr/include/skia/include/"
# Install all libraries produced by this build dir, not just libskia*.
# This picks up optional Skia module libs when present (e.g. skparagraph/skshaper).
find "$PKG_BUILD_DIR" -maxdepth 1 -type f \
  \( -name 'lib*.a' -o -name 'lib*.so' -o -name 'lib*.so.*' \) \
  -exec install -m644 {} "$PKG_STORE_DIR/usr/lib/" \;
