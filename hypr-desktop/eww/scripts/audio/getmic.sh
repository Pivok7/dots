#!/bin/sh

pactlvol() {
    pactl get-source-volume @DEFAULT_SOURCE@\
    | grep -o '[0-9]\+%'\
    | tr -d '%'
}

amixervol() {
    amixer get Capture\
    | grep -i 'Front Left:'\
    | awk -F'[][]' '{print $2}'\
    | tr -d '%'
}

# PulseAudio or pipewire-pulse
pulseaudio() {
    pactl subscribe sink | while read -r line; do
	if echo "$line" | grep -q "change"; then
	    pactlvol
	fi
    done
}

# Last resort. Polling amixer
alsa() {
    while true; do
	amixervol
	sleep 0.2
    done
}

if command -v pactl &> /dev/null; then
    pactlvol
    pulseaudio
else
    alsa
fi
