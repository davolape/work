#!/bin/bash
log_info() {
    local path=$1
    local type=$2
    local date=$(date +"%d-%m-%Y %H:%M:%S")   
    if [ "$type" == "DIR" ]; then
        echo "$date DIR $path" >> part1.log
    else
        size=$(stat -c%s "$path")
        echo "$date FILE $path SIZE=${size}B" >> part1.log
    fi
}