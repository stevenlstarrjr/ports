#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"

# Upstream always adds tests/ in top-level CMakeLists, which pulls
# googletest via FetchContent. Force-disable that path for packaged builds.
if grep -q 'add_subdirectory(tests)' "$PKG_SRC_DIR/CMakeLists.txt"; then
  sed -i '/add_subdirectory(tests)/d' "$PKG_SRC_DIR/CMakeLists.txt"
fi

cmake -S "$PKG_SRC_DIR" -B "$PKG_BUILD_DIR" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_FLAGS="-Wno-error=return-type" \
  -DCMAKE_CXX_FLAGS="-Wno-error=return-type" \
  -DBUILD_TESTING=OFF \
  -DYOGA_BUILD_TESTS=OFF \
  -DYOGA_ENABLE_TESTS=OFF \
  -DYOGA_BUILD_BENCHMARKS=OFF
cmake --build "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}"
