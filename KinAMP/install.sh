#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

# Download + Extract
curl -fSL --progress-bar -o "$TMPDIR/kinamp.zip" https://github.com/kbarni/KinAMP/releases/latest/download/kinamp.zip
unzip -q "$TMPDIR/kinamp.zip" -d /mnt/us

# Cleanup
rm -rf "$TMPDIR"

exit 0
