#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
INSTALL_DIR=/mnt/us/kindle_hid_passthrough
RELEASE_URL="https://github.com/zampierilucas/kindle-hid-passthrough/releases/latest/download"

# The running daemon keeps dist/ld-linux-armhf.so.3 busy, and busybox tar stops
# at the first entry it cannot replace, so stop it before unpacking.
/sbin/stop hid-passthrough 2>/dev/null || true
pkill -f "kindle-hid-passthrough" 2>/dev/null || true
pkill -f "ld-linux-armhf." 2>/dev/null || true
sleep 2

mkdir -p "$TMPDIR" "$INSTALL_DIR"

curl -fSL --progress-bar -o "$TMPDIR/release.tar.gz" \
    "$RELEASE_URL/kindle-hid-passthrough-armv7.tar.gz"
tar -xzf "$TMPDIR/release.tar.gz" -C "$INSTALL_DIR"

rm -rf "$TMPDIR"

sh "$INSTALL_DIR/scripts/install.sh" installAll

exit 0
