#!/bin/sh

case "$1" in
    "up")
	eww update mic_vol=$(($(eww get mic_vol)+1))
    ;;
    "down")
	eww update mic_vol=$(($(eww get mic_vol)-1))
    ;;
    *) exit 1 ;;
esac

echo "$1" "1" >> /tmp/eww_mic.tmp
