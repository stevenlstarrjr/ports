#!/usr/bin/env bash
set -euo pipefail

gcc_store_candidates=(/usr/ports/store/*-gcc-15.2.0)
if [[ ${#gcc_store_candidates[@]} -ne 1 || ! -d "${gcc_store_candidates[0]}" ]]; then
  echo "expected exactly one gcc-15.2.0 store dir, found: ${gcc_store_candidates[*]-<none>}" >&2
  exit 1
fi

gcc_store="${gcc_store_candidates[0]}"
runtime_fallback_candidates=(/usr/ports/store/*-gcc-runtime-15.2.0)
mkdir -p "$PKG_STORE_DIR/usr/lib"

copy_runtime_family() {
  local pattern="$1"
  shopt -s nullglob
  local matches=("$gcc_store"/usr/lib/$pattern)
  if [[ ${#matches[@]} -eq 0 ]]; then
    for candidate in "${runtime_fallback_candidates[@]}"; do
      if [[ "$candidate" == "$PKG_STORE_DIR" || ! -d "$candidate" ]]; then
        continue
      fi
      matches=("$candidate"/usr/lib/$pattern)
      if [[ ${#matches[@]} -gt 0 ]]; then
        break
      fi
    done
  fi
  shopt -u nullglob
  if [[ ${#matches[@]} -eq 0 ]]; then
    echo "missing runtime pattern: $pattern" >&2
    exit 1
  fi
  cp -a "${matches[@]}" "$PKG_STORE_DIR/usr/lib/"
}

copy_runtime_family 'libstdc++.so*'
copy_runtime_family 'libgcc_s.so*'
