#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed 's/! $output_file eq/$output_file ne/' -i tp/Texinfo/Convert/*.pm

./configure --prefix=/usr

make -j"${PKG_JOBS:-1}"



make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd
