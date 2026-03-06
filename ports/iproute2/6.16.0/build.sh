#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_SRC_DIR"
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

make -j"${PKG_JOBS:-1}" NETNS_RUN_DIR=/run/netns
