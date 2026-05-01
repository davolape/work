#!/bin/bash

create_f() {
    local directory=$1
    local numb=$2
    local strochka=$3
    local data=$4
    local size=$5
    
    local file_name=$(echo "$strochka" | cut -d '.' -f1)
    local rasshir=$(echo "$strochka" | cut -d '.' -f2)
    
    if [ -z "$strochka" ]; then
        echo "Ошибка: имя файла пустое"
        exit 1
    fi

    local size_mb=$(echo "$size" | tr -d '[:space:]' | sed -E 's/[mM][bB]?$//')
    if ! [[ "$size_mb" =~ ^([1-9][0-9]?$|^100)$ ]]; then
        echo "ERROR! Razmer fayla ne norm ($size)"
        exit 1
    fi
    
    local bayts=$((size_mb * 1024 * 1024))

    for ((i=1; i<=numb; i++)); do
        LEN=$((5 + RANDOM % 6))
        FILENAME=$(generator_imya "$file_name" "$LEN" "$data")."$rasshir"
        FILEPATH="$directory/$FILENAME"
        dd if=/dev/zero of="$FILEPATH" bs=1M count="$size_mb" status=none
        log_vhod "$FILEPATH" "FILE" "$bayts"
    done

}