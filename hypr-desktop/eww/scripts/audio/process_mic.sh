#!/bin/sh
cd "$(dirname "$0")"

INPUT="/tmp/eww_mic.tmp"
touch "$INPUT"

COUNTER=0

while IFS= read -r line; do
    set -- $line

    UD=$1
    VAL=$2

    case "$UD" in
	"down") VAL=$((-VAL)) ;;
	"up") ;;
	*) exit 1 ;;
    esac

    COUNTER=$((COUNTER += VAL))
done < "$INPUT"

> "$INPUT"

if ((COUNTER != 0)); then
    if (( COUNTER > 0 )); then
	./set_mic.sh "up" "$COUNTER"
    else
	./set_mic.sh "down" $((-COUNTER))
    fi
fi
