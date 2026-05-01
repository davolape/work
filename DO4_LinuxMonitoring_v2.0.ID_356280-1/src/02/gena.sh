#!/bin/bash

generator_imya() {
    local bukvvi="$1"
    local length="$2"
    local date="$3"
    local name="$bukvvi"
    
    while [ ${#name} -lt "$length" ]; do
        local pos=$((RANDOM % ${#bukvvi}))
        name="${name}${bukvvi:$pos:1}"
    done

    echo "${name}_${date}"
}
