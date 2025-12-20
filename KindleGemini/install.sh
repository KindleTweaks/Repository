#!/bin/sh
# KindleForge Install Script for KindleGemini

ZIP_URL="https://github.com/BaconWillRule/Kindle-Gemini/releases/download/Latest/KindleGemini.zip"


APP_ID="com.baconwillrule.kindlegemini"
APP_DIR="/var/local/mesquite/KindleGemini"
DOC_DIR="/mnt/us/documents"
DB="/var/local/appreg.db"
TEMP_ZIP="/tmp/KindleGemini.zip"
TEMP_EXTRACT="/tmp/KindleGemini_Extract"

# 1. Download
if curl -L -o "$TEMP_ZIP" "$ZIP_URL"; then
    : # Silent success
else
    exit 1
fi

# 2. Extract
rm -rf "$TEMP_EXTRACT"
mkdir -p "$TEMP_EXTRACT"
unzip -o "$TEMP_ZIP" -d "$TEMP_EXTRACT" > /dev/null

# 3. Install App Folder
if [ -d "$APP_DIR" ]; then
    rm -rf "$APP_DIR"
fi

if [ -d "$TEMP_EXTRACT/KindleGemini" ]; then
    cp -r "$TEMP_EXTRACT/KindleGemini" "$APP_DIR"
    chmod -R 755 "$APP_DIR"
else
    exit 1
fi

# 4. Install Launcher Script (Icon)
if [ -f "$TEMP_EXTRACT/KindleGemini.sh" ]; then
    cp "$TEMP_EXTRACT/KindleGemini.sh" "$DOC_DIR/KindleGemini.sh"
fi

# 5. Register in AppReg
sqlite3 "$DB" <<EOF
INSERT OR IGNORE INTO interfaces(interface) VALUES('application');
INSERT OR IGNORE INTO handlerIds(handlerId) VALUES('$APP_ID');
INSERT OR REPLACE INTO properties(handlerId,name,value) VALUES('$APP_ID','lipcId','$APP_ID');
INSERT OR REPLACE INTO properties(handlerId,name,value) VALUES('$APP_ID','command','/usr/bin/mesquite -l $APP_ID -c file://$APP_DIR/');
INSERT OR REPLACE INTO properties(handlerId,name,value) VALUES('$APP_ID','supportedOrientation','U');
EOF

# 6. Cleanup
rm -f "$TEMP_ZIP"
rm -rf "$TEMP_EXTRACT"

# Refresh UI (optional but good)
lipc-set-prop com.lab126.appmgrd request-refresh true
