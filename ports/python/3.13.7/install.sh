#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
make DESTDIR="$PKG_STORE_DIR" install
site_packages_dir="$PKG_STORE_DIR/usr/lib/python3.13/site-packages"
mkdir -p "$site_packages_dir"
cat > "$site_packages_dir/zz-profile-site-packages.pth" <<'EOF'
/usr/lib/python3.13/site-packages
EOF
mkdir -p "$PKG_STORE_DIR/etc"
cat > "$PKG_STORE_DIR/etc/pip.conf" <<'EOF'
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF
if [[ -f /usr/ports/python-3.13.7-docs-html.tar.bz2 ]]; then
  mkdir -p "$PKG_STORE_DIR/usr/share/doc/python-3.13.7/html"
  tar --strip-components=1 \
      --no-same-owner \
      --no-same-permissions \
      -C "$PKG_STORE_DIR/usr/share/doc/python-3.13.7/html" \
      -xf /usr/ports/python-3.13.7-docs-html.tar.bz2
fi
