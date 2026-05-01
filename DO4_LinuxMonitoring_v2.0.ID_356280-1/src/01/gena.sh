#!/bin/bash
generator_imya() {
    local bukvvi="$1"
    local length="$2"
    local date="$3"
    local i=0
    local name=""
    local counter="$4"

    while [ ${#name} -lt $length ]; do
        name="${name}${bukvvi:$((i % ${#bukvvi})):1}"
        ((i++))
    done

    echo "${name}${counter}_${date}"
}