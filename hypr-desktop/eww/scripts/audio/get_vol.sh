#!/bin/sh

pulsevol() {
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    if [ "$mute" == "yes" ]; then
	echo "-1"
    else
	pactl get-sink-volume @DEFAULT_SINK@\
	| grep -o '[0-9]\+%'\
	| tr -d '%'
    fi
}

alsavol() {
    if echo "$(amixer get Master)" | grep -q "\[off\]"; then
	echo "-1"
    else
	amixer -D pulse sget Master \
	| awk -F '[^0-9]+' '/Left:/{print $3}'
    fi
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
