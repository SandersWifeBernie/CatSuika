#!/bin/sh
echo -ne '\033c\033]0;catSuika\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/catSuika.arm64" "$@"
