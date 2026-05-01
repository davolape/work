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

    local size_kb=$(echo "$size" | tr -d '[:space:]' | sed 's/kb//i')
    if ! [[ "$size_kb" =~ ^[0-9]+$ ]]; then
        echo "ERROR! Razmer fayla ne norm ($size)"
        exit 1
    fi

    for ((i=1; i<=numb; i++)); do
        FILENAME=$(generator_imya "$file_name" 4 "$data" "$i")."$rasshir"
        FILEPATH="$directory/$FILENAME"
        dd if=/dev/zero of="$FILEPATH" bs=1K count="$size_kb" status=none
        log_info "$FILEPATH" "FILE"
    done

}