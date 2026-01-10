#!/bin/sh

mntroot rw
cd /usr/bin
mv otaupd.bck otaupd
mv otav3.bck otav3
mntroot ro
reboot
