#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/PEKI.zip" https://github.com/KindleTweaks/PEKI/releases/download/v1.0/PEKI.zip
unzip -q "$TMPDIR/PEKI.zip" -d "$TMPDIR"

# Copy Contents
cp "$TMPDIR/KUAL.sh" /mnt/us/documents/
cp "$TMPDIR/KUAL.jar" /mnt/us/documents/
chmod +x /mnt/us/documents/KUAL.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0