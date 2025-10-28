#!/bin/sh

set -e

TMPDIR=/mnt/us/KF-Update-Temp

rm -rf "$TMPDIR" # Cleanup Any Previous Temp
mkdir -p "$TMPDIR"

eips 1 25 "Updating KindleForge, Please Wait..."

# Download + Extract
curl -L -o "$TMPDIR/KindleForge.zip" https://github.com/KindleTweaks/KindleForge/releases/latest/download/KindleForge.zip
unzip -q "$TMPDIR/KindleForge.zip" -d "$TMPDIR"

eips 1 26 "Downloaded + Extracted"

# Out With The Old
rm -rf /mnt/us/documents/KindleForge
rm -f /mnt/us/documents/KindleForge.sh

# In With The New
cp -r "$TMPDIR"/* /mnt/us/documents/

eips 1 27 "Update Installed"

# Just In Case
sync
sleep 1

# Cleanup
rm -rf "$TMPDIR"

# Homescreen, Kill Mesquite

lipc-set-prop com.lab126.appmgrd start app://com.lab126.booklet.home

sleep 2

killall mesquite

sleep 2

eips 1 28 "You May Now Use KindleForge"

exit 0
