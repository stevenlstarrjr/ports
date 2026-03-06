#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
git fetch --unshallow --tags || git fetch --tags --depth=1000000
sed -i "s/'--match', ROOT_TAG]/'--match', ROOT_TAG, '--always']/" build/gen.py
export CC="${CC:-gcc}"
export CXX="${CXX:-g++}"
python3 build/gen.py --out-path out
sed -i 's/-Werror//g' out/build.ninja
ninja -C out -j"${PKG_JOBS:-1}" gn
