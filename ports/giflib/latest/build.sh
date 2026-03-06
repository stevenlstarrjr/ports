#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR/bin"
if command -v aclocal >/dev/null 2>&1; then
  ln -sf "$(command -v aclocal)" "$PKG_BUILD_DIR/bin/aclocal-1.15"
fi
if command -v automake >/dev/null 2>&1; then
  ln -sf "$(command -v automake)" "$PKG_BUILD_DIR/bin/automake-1.15"
fi
if command -v autoconf >/dev/null 2>&1; then
  ln -sf "$(command -v autoconf)" "$PKG_BUILD_DIR/bin/autoconf"
fi
if command -v autoheader >/dev/null 2>&1; then
  ln -sf "$(command -v autoheader)" "$PKG_BUILD_DIR/bin/autoheader"
fi
export PATH="$PKG_BUILD_DIR/bin:$PATH"
cd "$PKG_BUILD_DIR"
"$PKG_SRC_DIR"/configure --prefix=/usr --disable-static
make -j"${PKG_JOBS:-1}"
