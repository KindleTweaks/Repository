#!/bin/sh

mntroot rw
cd /usr/bin
mv otaupd otaupd.bck
mv otav3 otav3.bck
mntroot ro
reboot
