#!/bin/bash
get_sys_info() {
    HOSTNAME=$(hostname)
    TIMEZONE="$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')"
    USER=$(whoami)
    OS="$(lsb_release -ds)"
    DATE="$(date +'%d %B %Y %T')"
    UPTIME="$(uptime -p)"
    UPTIME_SEC="$(awk '{print int($1)}' /proc/uptime)"
    IP="$(hostname -I | awk '{print $1}')"
    MASK="$(ifconfig | grep -w "netmask" | head -1 | awk '{print $4}')"
    GATEWAY="$(ip route | grep default | awk '{print $3}')"
    RAM_TOTAL="$(free -m | awk '/Mem:/ {printf "%.3f GB", $2/1024}')"
    RAM_USED="$(free -m | awk '/Mem:/ {printf "%.3f GB", $3/1024}') MB"
    RAM_FREE="$(free -m | awk '/Mem:/ {printf "%.3f GB", $4/1024}') MB"
    SPACE_ROOT="$(df / | awk 'NR==2 {printf "%.2f MB", $2/1024}')"
    SPACE_ROOT_USED="$(df / | awk 'NR==2 {printf "%.2f MB", $3/1024}')"
    SPACE_ROOT_FREE="$(df / | awk 'NR==2 {printf "%.2f MB", $4/1024}')"
}