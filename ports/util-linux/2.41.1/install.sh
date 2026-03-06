#!/usr/bin/env bash
set -euo pipefail
cd "$PKG_BUILD_DIR"
# util-linux's wall install hook tries to chgrp the staged binary to "tty".
# That fails in an unprivileged/store build, and the generated Makefile
# hardcodes `chgrp tty ...` in the hook, so neutralize that step.
sed -i $'s#^\tchgrp tty .*#\t/bin/true#' Makefile
make DESTDIR="$PKG_STORE_DIR" install

mkdir -p "$PKG_STORE_DIR/usr/lib/pkgconfig"

cat >"$PKG_STORE_DIR/usr/lib/pkgconfig/mount.pc" <<'EOF'
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: mount
Description: util-linux libmount
Version: 2.41.1
Requires:
Libs: -L${libdir} -lmount
Cflags: -I${includedir}/libmount
EOF

cat >"$PKG_STORE_DIR/usr/lib/pkgconfig/blkid.pc" <<'EOF'
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: blkid
Description: util-linux libblkid
Version: 2.41.1
Requires:
Libs: -L${libdir} -lblkid
Cflags: -I${includedir}/blkid
EOF

cat >"$PKG_STORE_DIR/usr/lib/pkgconfig/uuid.pc" <<'EOF'
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: uuid
Description: util-linux libuuid
Version: 2.41.1
Requires:
Libs: -L${libdir} -luuid
Cflags: -I${includedir}/uuid
EOF
