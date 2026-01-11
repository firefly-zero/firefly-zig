#!/bin/bash
# Build script for static docs used on Cloudflare Pages.
set -e
wget https://ziglang.org/builds/zig-x86_64-linux-0.16.0-dev.1912+0cbaaa5eb.tar.xz
tar xf zig-*.tar.xz
rm zig-*.tar.xz
./zig-*/zig build-lib -femit-docs src/root.zig -target wasm32-freestanding
rm libroot.a
