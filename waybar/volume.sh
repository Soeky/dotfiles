#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f", $2 * 100}')
mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o "MUTED")

if [ "$mute" = "MUTED" ]; then
    echo "🔇"
else
    echo "🔊 $volume%"
fi
