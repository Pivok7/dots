#!/bin/bash

if command -v wpctl &> /dev/null; then
    if [ "$1" = "up" ]; then
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
    else [ "$1" = "down" ]
	wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
    fi
else
    if [ "$1" = "up" ]; then
	amixer set Master 1%+
    else [ "$1" = "down" ]
	amixer set Master 1%-
    fi
fi
