#!/bin/bash

check_space() {
    local free=$(df -р / | awk 'NR==2 {print $4}')
    if [ "$free" -lt 1048576 ]; then
    return 1
    fi
    return 0
}