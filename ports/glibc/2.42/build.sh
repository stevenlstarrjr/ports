#!/usr/bin/env bash
set -euo pipefail

cd "$PKG_SRC_DIR"

# Keep patch local to the recipe for reproducibility.
patch -Np1 -i "$PKG_ROOT/ports/glibc/2.42/glibc-2.42-fhs-1.patch"

sed -e '/unistd.h/i #include <string.h>' \
    -e '/libc_rwlock_init/c\
  __libc_rwlock_define_initialized (, reset_lock);\
  memcpy (&lock, &reset_lock, sizeof (lock));' \
    -i stdlib/abort.c

mkdir -p build
cd build

echo "rootsbindir=/usr/sbin" > configparms

../configure --prefix=/usr                   \
             --disable-werror                \
             --disable-nscd                  \
             libc_cv_slibdir=/usr/lib        \
             --enable-stack-protector=strong \
             --enable-kernel=5.4

make -j"${PKG_JOBS:-1}"
