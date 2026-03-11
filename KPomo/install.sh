#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/kpomo.zip" https://github.com/crizmo/kpomo/releases/latest/download/kpomo.zip
unzip -q "$TMPDIR/kpomo.zip" -d "$TMPDIR"

# Copy Contents
mkdir -p /mnt/us/documents/kpomo
cp -r "$TMPDIR/kpomo"/* /mnt/us/documents/kpomo/
cp "$TMPDIR/kpomo.sh" /mnt/us/documents/
chmod +x /mnt/us/documents/kpomo.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0