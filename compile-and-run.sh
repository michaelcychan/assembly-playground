#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

name="$1"

mkdir -p ./bin/
nasm -f elf64 "${name}.asm" -o "./bin/${name}.o"
ld "./bin/${name}.o" -o "./bin/${name}"
chmod +x "./bin/${name}"
"./bin/${name}"
echo "[Exited with error code: $?]"