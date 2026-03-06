#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/unix"
make DESTDIR="$PKG_STORE_DIR" install
chmod 644 "$PKG_STORE_DIR/usr/lib/libtclstub8.6.a"
chmod u+w "$PKG_STORE_DIR/usr/lib/libtcl8.6.so"
make DESTDIR="$PKG_STORE_DIR" install-private-headers
ln -sf tclsh8.6 "$PKG_STORE_DIR/usr/bin/tclsh"
if [[ -e "$PKG_STORE_DIR/usr/share/man/man3/Thread.3" ]]; then
  mv "$PKG_STORE_DIR/usr/share/man/man3/Thread.3" \
     "$PKG_STORE_DIR/usr/share/man/man3/Tcl_Thread.3"
fi
sed -e "s|$PKG_SRC_DIR/unix|/usr/lib|" \
    -e "s|$PKG_SRC_DIR|/usr/include|" \
    -i "$PKG_STORE_DIR/usr/lib/tclConfig.sh"
if [[ -e "$PKG_STORE_DIR/usr/lib/tdbc1.1.10/tdbcConfig.sh" ]]; then
  sed -e "s|$PKG_SRC_DIR/unix/pkgs/tdbc1.1.10|/usr/lib/tdbc1.1.10|" \
      -e "s|$PKG_SRC_DIR/pkgs/tdbc1.1.10/generic|/usr/include|" \
      -e "s|$PKG_SRC_DIR/pkgs/tdbc1.1.10/library|/usr/lib/tcl8.6|" \
      -e "s|$PKG_SRC_DIR/pkgs/tdbc1.1.10|/usr/include|" \
      -i "$PKG_STORE_DIR/usr/lib/tdbc1.1.10/tdbcConfig.sh"
fi
if [[ -e "$PKG_STORE_DIR/usr/lib/itcl4.3.2/itclConfig.sh" ]]; then
  sed -e "s|$PKG_SRC_DIR/unix/pkgs/itcl4.3.2|/usr/lib/itcl4.3.2|" \
      -e "s|$PKG_SRC_DIR/pkgs/itcl4.3.2/generic|/usr/include|" \
      -e "s|$PKG_SRC_DIR/pkgs/itcl4.3.2|/usr/include|" \
      -i "$PKG_STORE_DIR/usr/lib/itcl4.3.2/itclConfig.sh"
fi
mkdir -p "$PKG_STORE_DIR/usr/share/doc/tcl-8.6.16"
tmpdoc="$(mktemp -d)"
trap 'rm -rf "$tmpdoc"' EXIT
tar -xf /usr/ports/tcl8.6.16-html.tar.gz -C "$tmpdoc" --strip-components=1
cp -r --no-preserve=ownership "$tmpdoc"/html/. "$PKG_STORE_DIR/usr/share/doc/tcl-8.6.16/"
