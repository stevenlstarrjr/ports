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

link_one() {
  local src="$1"
  local dst="$2"
  local parent
  parent=$(parent_dir "$dst")
  mkdir -p "$parent"

  if [[ -L "$dst" ]]; then
    local cur
    cur=$(readlink "$dst" || true)
    if [[ "$cur" == "$src" ]]; then
      return 0
    fi
    echo "error: activation conflict for $dst" >&2
    echo "  existing symlink target: $cur" >&2
    echo "  requested target: $src" >&2
    exit 1
  fi

  if [[ -e "$dst" ]]; then
    echo "error: activation conflict for $dst (non-symlink already exists)" >&2
    exit 1
  fi

  ln -s "$src" "$dst"
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
      link_one "$path" "$NPKG_PROFILE_DIR/$rel"
      if [[ "$rel" == etc/* ]]; then
        link_one "/usr/ports/profile/current/$rel" "$NPKG_TARGET_ROOT/${rel}"
      fi
    fi
  done
}

walk_store "$PKG_STORE_DIR"
