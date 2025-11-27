#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/KNotes.zip" https://github.com/crizmo/KNotes/releases/latest/download/KNotes.zip
unzip -oq "$TMPDIR/KNotes.zip" -d "$TMPDIR"

# Copy Contents
mkdir -p /mnt/us/documents/KNotes
cp -r "$TMPDIR/KNotes"/* /mnt/us/documents/KNotes/
cp "$TMPDIR/KNotes.sh" /mnt/us/documents/
chmod +x /mnt/us/documents/KNotes.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0