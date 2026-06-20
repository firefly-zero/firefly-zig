#!/bin/bash
# Build script for static docs used on Cloudflare Pages.
set -e
wget https://ziglang.org/download/0.16.0/zig-x86_64-linux-0.16.0.tar.xz
tar xf zig-*.tar.xz
rm zig-*.tar.xz
./zig-*/zig build-lib -femit-docs src/root.zig -target wasm32-freestanding
rm libroot.a
