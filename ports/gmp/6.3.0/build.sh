#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i '/long long t1;/,+1s/()/(...)/' configure

configure_env=()
if [[ "$(uname -m)" =~ ^i[3-6]86$ && -n "${CFLAGS:-}" ]]; then
  configure_env=(ABI=32)
fi
env "${configure_env[@]}" ./configure --prefix=/usr    \
                                      --enable-cxx     \
                                      --disable-static \
                                      --docdir=/usr/share/doc/gmp-6.3.0

make -j"${PKG_JOBS:-1}"
make html
