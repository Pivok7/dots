#!/bin/sh
FIFO="/tmp/eww_audio.fifo"
[ -p "$FIFO" ] || mkfifo "$FIFO"

# Open the FIFO once and keep it open for the whole run
exec 3> "$FIFO"

if [ "$#" -eq 3 ]; then
    echo "$1 $2 $3" > $FIFO
elif [ "$#" -eq 2 ]; then
    echo "$1 $2 1" > $FIFO
fi

