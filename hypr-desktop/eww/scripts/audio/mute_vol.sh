#!/bin/sh

# Pipewire + Wireplumber
if command -v wpctl &> /dev/null; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
# Fall back to ALSA
else
    amixer set Master toggle
fi
