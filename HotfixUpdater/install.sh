#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/HotfixUpdater.zip" https://github.com/KindleTweaks/HotfixUpdater/releases/latest/download/HotfixUpdater.zip
unzip -q "$TMPDIR/HotfixUpdater.zip" -d "$TMPDIR"

# Copy Contents
mkdir -p /mnt/us/documents/HotfixUpdater
cp -r "$TMPDIR/HotfixUpdater"/* /mnt/us/documents/HotfixUpdater/
cp "$TMPDIR/HotfixUpdater.sh" /mnt/us/documents/
chmod +x /mnt/us/documents/HotfixUpdater.sh

# Cleanup
rm -rf "$TMPDIR"

exit 0