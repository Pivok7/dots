#!/bin/sh

case "$1" in
    "up")
	eww update volume=$(($(eww get volume)+1))
    ;;
    "down")
	eww update volume=$(($(eww get volume)-1))
    ;;
    *) exit 1 ;;
esac

echo "$1" "1" >> /tmp/eww_vol.tmp
