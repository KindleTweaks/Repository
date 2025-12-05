#!/bin/sh

set -e

TMPDIR=/mnt/us/KF-Update-Temp

alert() {
    TITLE="$1"
    TEXT="$2"

    TITLE_ESC=$(printf '%s' "$TITLE" | sed 's/"/\\"/g')
    TEXT_ESC=$(printf '%s' "$TEXT" | sed 's/"/\\"/g')

    JSON='{ "clientParams":{ "alertId":"appAlert1", "show":true, "customStrings":[ { "matchStr":"alertTitle", "replaceStr":"'"$TITLE_ESC"'" }, { "matchStr":"alertText", "replaceStr":"'"$TEXT_ESC"'" } ] } }'

    lipc-set-prop com.lab126.pillow pillowAlert "$JSON"
}

# Failsafe
failsafe() {
    CODE=$?
    if [ "$CODE" != 0 ]; then
        alert "Update Failed!" "Something Went Wrong!\nExit Code: $CODE"
        sync
    fi
}
trap failsafe EXIT

rm -rf "$TMPDIR"
mkdir -p "$TMPDIR"

alert "Updating..." "Updating KindleForge, Please Wait..."

# Download + Extract
curl -fSL -o "$TMPDIR/KindleForge.zip" \
    https://github.com/KindleTweaks/KindleForge/releases/latest/download/KindleForge.zip

unzip -q "$TMPDIR/KindleForge.zip" -d "$TMPDIR"

alert "Updating..." "Downloaded + Extracted"

# Delete Old Version
rm -rf /mnt/us/documents/KindleForge
rm -f /mnt/us/documents/KindleForge.sh

# Install New Version
cp -r "$TMPDIR"/* /mnt/us/documents/

alert "Updating..." "Update Installed Successfully!"

sync
sleep 1

rm -rf "$TMPDIR"

# Go Home
lipc-set-prop com.lab126.appmgrd start app://com.lab126.booklet.home
sleep 2
killall mesquite || true
sleep 2

alert "Updating Complete!" "You May Now Use KindleForge."

exit 0
