#!/bin/bash

check_space() {
    local free=$(df -h / | awk 'NR==2 {print $4}')
    local numb=$(echo "$free" | grep -oE '[0-9\.]+(\.[0-9]+)?')
    local mera=$(echo "$free" | grep -oE '[A-Za-z]+')

    local free_kb=0
    case "$mera" in
        G|g) free_kb=$(echo "$numb * 1024 * 1024" | bc | awk '{printf "%d", $1}') ;;
        M|m) free_kb=$(echo "$numb * 1024" | bc | awk '{printf "%d", $1}') ;;
        K|k) free_kb=$(echo "$numb" | bc | awk '{printf "%d", $1}') ;;
        *) return 1 ;;
    esac
    echo "Свободно КБ: $free_kb"
    if [ "$free_kb" -le 1048576 ]; then
        return 1
    fi

    return 0
}