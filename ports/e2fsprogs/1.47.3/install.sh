#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR/build"
make DESTDIR="$PKG_STORE_DIR" install

rm -f "$PKG_STORE_DIR"/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

mkdir -p "$PKG_STORE_DIR/usr/share/info"
if [[ -e "$PKG_STORE_DIR/usr/share/info/libext2fs.info.gz" ]]; then
  gunzip -f "$PKG_STORE_DIR/usr/share/info/libext2fs.info.gz"
fi

makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo
install -m644 doc/com_err.info "$PKG_STORE_DIR/usr/share/info/"

if [[ -e "$PKG_STORE_DIR/etc/mke2fs.conf" ]]; then
  sed 's/metadata_csum_seed,//' -i "$PKG_STORE_DIR/etc/mke2fs.conf"
fi
