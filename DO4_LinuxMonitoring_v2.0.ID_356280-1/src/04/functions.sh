#!/bin/bash

generator_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

generator_vremya() {
    local start_date="$1"
    local count="$2"
    for ((i=0; i<count; i++)); do
        local seconds=$((i * (86400 /count)))
        date -d "$start_date + $seconds seconds" "+%d/%b/%Y:%H:%M:%S %z"
    done
}

generator_strok() {
    local ip="$1"
    local times="$2"
    local method="$3"
    local url="$4"
    local code="$5"
    local size="$6"
    local agent="$7"
    local filename="$8"
    
    echo "$ip - - [$times] \"$method $url HTTP/1.1\" $code $size \"-\" \"$agent\"" >> "$filename"
}