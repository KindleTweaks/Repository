#!/bin/sh
#
# KindleForge uninstaller for the Qur'an plugin.
#
# Removes what install.sh put there, and nothing else.
#
# DELIBERATELY LEFT BEHIND:
#
#   <koreader>/settings/quran.lua              reading position, bookmarks,
#                                              typography
#   <koreader>/settings/quran-translation.db   a translation the reader
#                                              side-loaded themselves
#
# Both are the reader's own data, not ours. Someone uninstalling to reinstall a
# newer build should not silently lose where they had got to, or a translation
# file they put there by hand. Anyone who genuinely wants them gone can delete
# two files; nobody can undo an uninstall that deleted them.
#
# The bundled Pickthall pack DOES go: it lives inside quran.koplugin/data/ and
# is ours to remove.

set -e

rm -rf /mnt/us/koreader/plugins/quran.koplugin
rm -rf /mnt/us/extensions/quran
rm -f /mnt/us/koreader/fonts/ScheherazadeNew-Regular.ttf
rm -f /mnt/us/koreader/fonts/ScheherazadeNew-OFL.txt

exit 0
