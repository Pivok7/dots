#!/bin/sh

# Pipewire + Wireplumber
if command -v wpctl &> /dev/null; then
    wpctl set-mute @DEFAULT_SOURCE@ toggle
# Fall back to ALSA
else
    amixer set Capture toggle
fi
