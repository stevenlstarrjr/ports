#!/usr/bin/env bash
set -euo pipefail
rm -rf "$PKG_BUILD_DIR"
mkdir -p "$PKG_BUILD_DIR"
cd "$PKG_SRC_DIR"

cat >"$PKG_BUILD_DIR/args.gn" <<'EOF'
is_official_build=true
is_component_build=false
is_debug=false
cc="gcc"
cxx="g++"
skia_use_gl=true
skia_use_egl=true
skia_use_vulkan=true
skia_use_vma=false
skia_enable_ganesh=true
skia_enable_graphite=false
skia_use_system_zlib=true
skia_use_system_libpng=true
skia_use_system_libjpeg_turbo=true
skia_use_system_libwebp=true
skia_use_system_expat=true
skia_use_system_icu=true
skia_use_freetype=true
skia_use_harfbuzz=true
skia_use_fontconfig=true
skia_use_wuffs=false
skia_use_dng_sdk=false
skia_use_libheif=false
skia_use_libjxl=false
skia_use_x11=false
skia_use_wayland=true
skia_use_system_freetype2=true
skia_use_system_harfbuzz=true
extra_cflags=["-I/usr/include/freetype2"]
extra_ldflags=["-L/usr/lib","-L/usr/lib64"]
EOF

gn gen "$PKG_BUILD_DIR" --args="$(tr '\n' ' ' < "$PKG_BUILD_DIR/args.gn")"
ninja -C "$PKG_BUILD_DIR" -j"${PKG_JOBS:-1}" skia
