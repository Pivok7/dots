#!/bin/sh
cd "$(dirname "$0")"

FIFO="/tmp/eww_audio.fifo"
[ -p "$FIFO" ] || mkfifo "$FIFO"
exec 3< "$FIFO"

UPDATE_INTERVAL=0.1

while :; do
    VOL_COUNTER=0
    MIC_COUNTER=0

    while IFS= read -r line <&3; do
	set -- $line

	TYPE=$1
	UD=$2
	VAL=$3

	case "$UD" in
	    "down") VAL=$((-VAL)) ;;
	    "up") ;;
	    *) continue ;;
	esac

	case "$TYPE" in
	    "vol") $((VOL_COUNTER += VAL)) ;;
	    "mic") $((MIC_COUNTER += VAL)) ;;
	    *) continue ;;
	esac
    done

    if ((VOL_COUNTER != 0)); then
	if ((VOL_COUNTER > 0)); then
	    ./set.sh "vol" "up" "$VOL_COUNTER"
	else
	    ./set.sh "vol" "down" "$((-VOL_COUNTER))"
	fi
    fi

    if ((MIC_COUNTER != 0)); then
	if ((MIC_COUNTER > 0)); then
	    ./set.sh "mic" "up" "$MIC_COUNTER"
	else
	    ./set.sh "mic" "down" "$((-MIC_COUNTER))"
	fi
    fi

    sleep "$UPDATE_INTERVAL"
done
