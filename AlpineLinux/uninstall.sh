#!/bin/sh

ALPINE_BASE_FOLDER="/mnt/us"

rm $ALPINE_BASE_FOLDER/alpine.ext3
rm $ALPINE_BASE_FOLDER/alpine.sh
rm $ALPINE_BASE_FOLDER/alpine.log
rm $ALPINE_BASE_FOLDER/alpine.conf
rm $ALPINE_BASE_FOLDER/alpine.zip
mntroot rw
rm /etc/upstart/alpine.conf
mntroot ro
rm $ALPINE_BASE_FOLDER/documents/alpinesc.sh