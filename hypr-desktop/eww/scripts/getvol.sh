#!/bin/sh

# PulseAudio or pipewire-pulse
pulseaudio() {
    pactl subscribe sink | while read -r line; do
	if echo "$line" | grep -q "change"; then
	    pamixer --get-volume
	fi
    done
}

# Last resort. Polling amixer
alsa() {
    while true; do
	amixer -D pulse sget Master\
	| awk -F '[^0-9]+' '/Left:/{print $3}'

	sleep 0.2
    done
}

if command -v pactl &> /dev/null; then
    pamixer --get-volume
    pulseaudio
else
    alsa
fi
