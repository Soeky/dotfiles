#!/usr/bin/env bash

# temporäres File für den Screenshot
file=$(mktemp --suffix=.png)

# Bereich auswählen & in die Datei speichern
grim -g "$(slurp)" "$file"

# 1) Wayland-Clipboard (wl-copy) – für lokale Wayland-Apps
wl-copy --type image/png < "$file"

# 2) XWayland-Clipboard (xclip) – damit KDE Connect/GSConnect das Bild greift
#xclip -selection clipboard -t image/png -i "$file"

#kdeconnect-cli -d d8ea2c21370a41e4a17b305f47519603 --share "$file"
# aufräumen
rm "$file"
