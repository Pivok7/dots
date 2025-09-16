#!/bin/bash

if command -v wpctl &> /dev/null; then
    if [ "$1" = "up" ]; then
	wpctl set-volume @DEFAULT_SOURCE@ 1%+
    else [ "$1" = "down" ]
	wpctl set-volume @DEFAULT_SOURCE@ 1%-
    fi
else
    if [ "$1" = "up" ]; then
	amixer set Capture 1%+
    else [ "$1" = "down" ]
	amixer set Capture 1%-
    fi
fi
