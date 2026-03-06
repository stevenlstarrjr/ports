#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"
make prefix=/usr \
  NO_TCLTK=YesPlease \
  NO_INSTALL_HARDLINKS=YesPlease \
  NO_GETTEXT=YesPlease \
  -j"${PKG_JOBS:-1}" all
