#!/usr/bin/env bash
set -euo pipefail

: "${PKG_STORE_DIR:?}"
: "${NPKG_PROFILE_DIR:?}"
: "${NPKG_TARGET_ROOT:?}"

shopt -s nullglob dotglob

should_skip_rel() {
  case "$1" in
    usr/share/info/dir) return 0 ;;
    *) return 1 ;;
  esac
}

parent_dir() {
  case "$1" in
    */*) printf '%s\n' "${1%/*}" ;;
    *) printf '.\n' ;;
  esac
}

unlink_one() {
  local src="$1"
  local dst="$2"
  [[ -L "$dst" ]] || return 0

  local cur
  cur=$(readlink "$dst" || true)
  [[ "$cur" == "$src" ]] || return 0

  rm -f "$dst"
  local dir
  dir=$(parent_dir "$dst")
  while [[ "$dir" != "$NPKG_PROFILE_DIR" && "$dir" != "$NPKG_TARGET_ROOT" && "$dir" == "$NPKG_PROFILE_DIR"/* || "$dir" == "$NPKG_TARGET_ROOT"/* ]]; do
    rmdir "$dir" 2>/dev/null || break
    dir=$(parent_dir "$dir")
  done
}

walk_store() {
  local path
  for path in "$1"/*; do
    [[ -e "$path" || -L "$path" ]] || continue
    if [[ -d "$path" && ! -L "$path" ]]; then
      walk_store "$path"
    elif [[ -f "$path" || -L "$path" ]]; then
      local rel=${path#"$PKG_STORE_DIR"/}
      should_skip_rel "$rel" && continue
      if [[ "$rel" == etc/* ]]; then
        unlink_one "/usr/ports/profile/current/$rel" "$NPKG_TARGET_ROOT/${rel}"
      fi
      unlink_one "$path" "$NPKG_PROFILE_DIR/$rel"
    fi
  done
}

walk_store "$PKG_STORE_DIR"
