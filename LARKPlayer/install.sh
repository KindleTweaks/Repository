#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
ZIPNAME=lark.zip

mkdir -p "$TMPDIR"

curl -fSL --progress-bar \
  -o "$TMPDIR/$ZIPNAME" \
  https://github.com/kbarni/LARKPlayer/releases/latest/download/lark.zip

unzip -oq "$TMPDIR/$ZIPNAME" -d /mnt/us/

rm -rf "$TMPDIR"

exit 0
