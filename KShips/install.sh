#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/KShips.zip" https://github.com/LOT-PL/KShips/releases/latest/download/KShips.zip
unzip -q "$TMPDIR/KShips.zip" -d "$TMPDIR"

# Copy Contents
mkdir -p /mnt/us/documents/KShips
cp -r "$TMPDIR/KShips"/* /mnt/us/documents/KShips/
cp "$TMPDIR/KShips.sh" /mnt/us/documents/
chmod +x /mnt/us/documents/KShips.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0