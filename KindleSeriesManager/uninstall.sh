#!/bin/sh

EXT_DIR="/mnt/us/extensions/kindle-series-manager"

# Stop the web server
HTTPD_PID="/tmp/kindle_series_manager_httpd.pid"
if [ -f "$HTTPD_PID" ]; then
    kill "$(cat "$HTTPD_PID")" 2>/dev/null
    rm -f "$HTTPD_PID"
fi
killall busybox-httpd 2>/dev/null
iptables -D INPUT -p tcp --dport 8080 -j ACCEPT 2>/dev/null

# Stop FBInk screensaver daemon and restore stock screensaver
SS_PID="/tmp/fbink_ss_daemon.pid"
if [ -f "$SS_PID" ]; then
    kill "$(cat "$SS_PID")" 2>/dev/null
    rm -f "$SS_PID"
fi
rm -f /tmp/fbink_ss_events.fifo /tmp/fbink_ss_last
start pillow 2>/dev/null
lipc-set-prop com.lab126.blanket load screensaver 2>/dev/null

# Stop Goodreads sync daemon and remove upstart job
stop gr-sync 2>/dev/null
rm -f /mnt/us/ENABLE_GR_SYNC
mntroot rw 2>/dev/null
rm -f /etc/upstart/gr-sync.conf

# Clean up Goodreads event FIFO
rm -f "$EXT_DIR/goodreads/gr_events.fifo"

# Remove disabled screensavers folder if empty
rmdir /mnt/us/screensaver_disabled 2>/dev/null

# Remove the extension
rm -rf "$EXT_DIR"

exit 0
