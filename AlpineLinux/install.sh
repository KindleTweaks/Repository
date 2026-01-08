#!/bin/sh
cd /mnt/base-us/
mntroot rw
ALPINE_URL="https://github.com/schuhumi/alpine_kindle/releases/latest/download/alpine.zip"
ALPINE_SC_URL="https://github.com/GreenCat-777/quicklinux-misc-files/releases/download/qai/alpinesc.sh"
echo "Download starting, this may take a minute"
curl -L -o "alpine.zip" "$ALPINE_URL"
unzip alpine.zip
rm alpine.zip
cp /mnt/base-us/alpine.conf /etc/upstart/
mntroot ro
cd /mnt/us/documents/
curl -L -o "alpinesc.sh" "$ALPINE_SC_URL"