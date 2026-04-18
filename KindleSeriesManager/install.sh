#!/bin/sh

set -e

TMPDIR=/mnt/us/KFPM-Temporary
mkdir -p "$TMPDIR"

REPO="mlapaglia/kindle-series-manager"
ASSET="kindle-series-manager"

LATEST_TAG=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name"' | sed 's/.*"tag_name": *"\([^"]*\)".*/\1/')

if [ -z "$LATEST_TAG" ]; then
    exit 1
fi

curl -fSL --progress-bar "https://github.com/$REPO/releases/download/$LATEST_TAG/$ASSET-$LATEST_TAG.zip" -o "$TMPDIR/ksm.zip"

unzip -o "$TMPDIR/ksm.zip" "kual-extension/*" -d "$TMPDIR"

mkdir -p /mnt/us/extensions
cp -r "$TMPDIR/kual-extension/kindle-series-manager" /mnt/us/extensions/

chmod +x /mnt/us/extensions/kindle-series-manager/bin/*.sh 2>/dev/null
chmod +x /mnt/us/extensions/kindle-series-manager/bin/busybox-httpd 2>/dev/null
chmod +x /mnt/us/extensions/kindle-series-manager/www/cgi-bin/*.cgi 2>/dev/null

rm -rf "$TMPDIR"

exit 0
