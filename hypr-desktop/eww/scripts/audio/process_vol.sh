#!/bin/sh
cd "$(dirname "$0")"

INPUT="/tmp/eww_vol.tmp"
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
	./set_vol.sh "up" "$COUNTER"
    else
	./set_vol.sh "down" $((-COUNTER))
    fi
fi
