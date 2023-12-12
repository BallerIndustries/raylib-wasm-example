#!/bin/bash
set -euo pipefail

cd ../emsdk
source emsdk_env.sh
cd ../raylib-wasm-example
cd src

emcc -o ../out/index.html \
    main.c -Os -Wall /Users/anguscheng/workspace/raylib/src/libraylib.a \
    -I. -I /usr/local/Cellar/raylib/4.5.0/include \
    -L. -L /Users/anguscheng/workspace/raylib/src \
    -s USE_GLFW=3 \
    -s ASYNCIFY \
    --shell-file ../shell.html \
    --preload-file resources \
    -s TOTAL_STACK=64MB \
    -s INITIAL_MEMORY=128MB \
    -s ASSERTIONS \
    -DPLATFORM_WEB

cd ../out
# BUILD_NAME="$(date -u +"%Y-%m-%d")"
# zip "${BUILD_NAME}.zip" index.html index.js index.wasm index.data

emrun index.html