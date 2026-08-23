#!/bin/sh
#
# KindleForge installer for the Qur'an plugin.
#
# The payload is NOT stored in the KindleForge repository -- that is the
# convention there (kTerm, KPomo and KOReader all fetch from upstream; only
# tiny script-only packages keep files in assets/). It lives in this project's
# own GitHub releases, and is fetched from the version-free
# /releases/latest/download/ URL so that every future release is picked up
# without another pull request against the package index.
#
# Requires KOReader, which is declared as a dependency in registry.json --
# this plugin renders nothing on its own.

set -e

TMPDIR=/mnt/us/KFPM-Temporary
PACKAGE="https://github.com/alfajrd/kindle-quran/releases/latest/download/quran.tar.gz"

mkdir -p "$TMPDIR"

# Fail early and loudly if KOReader is not there. The dependency is declared,
# but a manual install or a half-removed KOReader would otherwise leave the
# plugin unpacked into a directory nothing reads, which looks like a silent
# success and is the worst outcome available here.
if [ ! -d /mnt/us/koreader ]; then
  echo "Qur'an: /mnt/us/koreader not found -- install KOReader first." 1>&2
  rm -rf "$TMPDIR"
  exit 1
fi

# Download.
curl -fSL --progress-bar -o "$TMPDIR/quran.tar.gz" "$PACKAGE"

# The archive is laid out to extract straight into /mnt/us with no path
# rewriting: koreader/plugins/quran.koplugin, koreader/fonts and
# extensions/quran. Building it that way is what keeps this script short
# enough to audit -- see tools/make_release.py in the source repository.
tar -xf "$TMPDIR/quran.tar.gz" -C /mnt/us/

chmod +x /mnt/us/extensions/quran/bin/quran.sh

# Cleanup.
rm -rf "$TMPDIR"

exit 0
