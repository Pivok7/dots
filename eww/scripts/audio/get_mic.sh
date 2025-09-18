#!/bin/sh

pulsevol() {
    mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

    if [ "$mute" == "yes" ]; then
	echo "-1"
    else
	pactl get-source-volume @DEFAULT_SOURCE@\
	| grep -o '[0-9]\+%'\
	| tr -d '%'
    fi
}

alsavol() {
    amixer get Capture\
    | grep -i 'Front Left:'\
    | awk -F'[][]' '{print $2}'\
    | tr -d '%'
}

# PulseAudio or pipewire-pulse
pulseaudio() {
    pactl subscribe sink | while read -r line; do
	if echo "$line" | grep -q "change"; then
	    pulsevol
	fi
    done
}

# Last resort. Polling amixer
alsa() {
    while true; do
	alsavol
	sleep 0.2
    done
}

if command -v pactl &> /dev/null; then
    pulsevol
    pulseaudio
else
    alsa
fi
