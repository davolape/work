#!/bin/bash
proverka_input() {
    if [ $# -ne 3 ]; then
        echo "Error! Укажите 3 параметрa!"
        exit 1
    fi

[[ "$1" =~ ^[a-z]{1,7}$ ]] || { echo "Error! Параметр 1 - буквенный формат для названия папок"; exit 1; }
[[ "$2" =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]] || { echo "Error! Параметр 2 - формата imya.rasshirenie "; exit 1; }
local size=$(echo "$3" | tr -d '[:space:]' | sed -E 's/[mM][bB]?$//')
[[ "$size" =~ ^([1-9][0-9]?|100)$ ]] || { echo "Error! Параметр 3 - размер файла вида 88, не более 100"; exit 1; }
}