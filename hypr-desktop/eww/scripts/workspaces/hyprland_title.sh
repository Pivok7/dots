
title() {
    hyprctl activewindow | grep "title: " | awk '{print $NF}'
}

HYPRLAND_SIGNATURE_ACTUAL=$(ls -td /run/user/1000/hypr/*/ | head -n1 | xargs basename)
SOCKET="/run/user/1000/hypr/${HYPRLAND_SIGNATURE_ACTUAL}/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET" 2>&1 | while read -r line; do
    case $line in
        "activewindow>>"*)
            title
            ;;
    esac
done

