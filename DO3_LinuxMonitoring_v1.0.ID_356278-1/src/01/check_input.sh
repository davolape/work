#!/bin/bash
check_input() {
    if [ $# -eq 0 ]; then
        echo "Error! Укажите параметр!"
        exit 1
    fi

    INPUT="$1"

    if [[ "$INPUT" =~ ^[0-9]+$ ]]; then
        echo "Error! Параметр должен быть текстовым"
    else
        echo "Введеннй параметр: $INPUT"
    fi
}