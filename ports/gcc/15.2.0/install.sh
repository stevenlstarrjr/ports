#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR/build"
make DESTDIR="$PKG_STORE_DIR" install

# Keep runtime shared libraries in gcc-runtime to avoid profile collisions.
rm -f "$PKG_STORE_DIR/usr/lib"/libstdc++.so*
rm -f "$PKG_STORE_DIR/usr/lib"/libgcc_s.so*

mkdir -p "$PKG_STORE_DIR/usr/bin"
ln -sfn gcc "$PKG_STORE_DIR/usr/bin/cc"
ln -sfn g++ "$PKG_STORE_DIR/usr/bin/c++"

# Package-mode note: LFS post-install filesystem mutations are intentionally omitted.
mkdir -p "$PKG_STORE_DIR/share/pkg-notes"
cat > "$PKG_STORE_DIR/share/pkg-notes/gcc-postinstall.txt" <<NOTE
Omitted from package build:
- chown root:root on live /usr/lib/gcc headers
- live /usr/lib and /usr/share symlink creation
- compiler smoke tests against active host linker paths
- moving gdb auto-load files in live root
These belong in activation policy, not package build.
NOTE
