#!/bin/bash
# Build script for static docs used on Cloudflare Pages.
set -e
wget https://ziglang.org/download/0.15.2/zig-x86_64-linux-0.15.2.tar.xz
tar xf zig-*.tar.xz
rm zig-*.tar.xz
./zig-*/zig build-lib -femit-docs src/root.zig
rm libroot.a
