#!/bin/bash

if [ "$#" -eq 1 ]; then
    if command -v pavucontrol &> /dev/null; then
	case "$1" in
	    "vol") pavucontrol -t 3 ;;
	    "mic") pavucontrol -t 4 ;;
	esac
    else
	notify-send "From settings.sh" "No audio gui found"
    fi
fi
