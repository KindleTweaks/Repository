#!/bin/sh

set -e

mntroot rw

rm -rf /usr/local/bin/kpm
rm -rf /mnt/us/kpm
rm -rf /etc/kpm

mntroot ro

# Finish
exit 0