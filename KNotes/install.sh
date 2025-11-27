#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/knotes.zip" https://github.com/crizmo/knotes/releases/latest/download/knotes.zip
unzip -oq "$TMPDIR/knotes.zip" -d "$TMPDIR"

# Copy Contents
mkdir -p /mnt/us/documents/knotes
cp -r "$TMPDIR/knotes"/* /mnt/us/documents/knotes/
cp "$TMPDIR/knotes.sh" /mnt/us/documents/
chmod +x /mnt/us/documents/knotes.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0