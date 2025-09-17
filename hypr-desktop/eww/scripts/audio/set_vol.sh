#!/bin/bash

vol() {
    # Pipewire + Wireplumber
    if command -v wpctl &> /dev/null; then
	if [ "$1" = "up" ]; then
	    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${2}%+
	elif [ "$1" = "down" ]; then
	    wpctl set-volume @DEFAULT_AUDIO_SINK@ ${2}%-
	fi
    # Fall back to ALSA
    else
	if [ "$1" = "up" ]; then
	    amixer set Master ${2}%+
	elif [ "$1" = "down" ]; then
	    amixer set Master ${2}%-
	fi
    fi
}

if [ "$#" -eq 2 ]; then
    vol $1 $2
else
    vol $1 1
fi
