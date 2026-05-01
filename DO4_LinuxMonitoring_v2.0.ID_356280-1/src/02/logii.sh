#!/bin/bash
log_vhod() {
    local path=$1
    local type=$2
    local bayts=$3
    local date=$(date +"%d-%m-%Y %H:%M:%S")   
    if [ "$type" == "DIR" ]; then
        echo "$date DIR $path" >> part2.log
    else
        echo "$date FILE $path SIZE=${bayts}B" >> part2.log
    fi
}

log_vse() {
    echo "$@" >> part2.log
}