#!/bin/sh

set -e

TMPDIR=/mnt/us/LARKPlayer-Temporary
ZIPNAME=lark.zip

mkdir -p "$TMPDIR"

# Download latest release
curl -fSL --progress-bar \
  -o "$TMPDIR/$ZIPNAME" \
  https://github.com/kbarni/LARKPlayer/releases/latest/download/lark.zip

# Extract directly to /mnt/us
unzip -oq "$TMPDIR/$ZIPNAME" -d /mnt/us/

# Cleanup
rm -rf "$TMPDIR"

exit 0
