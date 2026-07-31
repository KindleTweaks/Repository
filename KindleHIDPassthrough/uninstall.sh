#!/bin/sh

set -e

INSTALL_DIR=/mnt/us/kindle_hid_passthrough

if [ -f "$INSTALL_DIR/scripts/install.sh" ]; then
    sh "$INSTALL_DIR/scripts/install.sh" uninstallAll
else
    # Nothing to delegate to, clear out what the install would have left.
    /sbin/stop hid-passthrough 2>/dev/null || true
    /usr/sbin/mntroot rw
    rm -f /etc/upstart/hid-passthrough.conf
    rm -f /etc/udev/rules.d/99-hid-keyboard.rules
    [ -f /usr/local/bin/dev_is_keyboard.sh ] && rm -f /usr/local/bin/dev_is_keyboard.sh
    /usr/sbin/udevadm control --reload-rules 2>/dev/null || true
    /usr/sbin/mntroot ro || true
    rm -rf "$INSTALL_DIR" /mnt/us/koreader/plugins/hidpassthrough.koplugin
    rm -f /mnt/us/documents/BTManager.sh
fi

exit 0
