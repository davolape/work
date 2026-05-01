#!/bin/bash
proverka_input() {
    if [ $# -ne 1 ]; then
        echo "Error! Укажите 1 параметр!"
        exit 1
    fi

[[ "$1" =~ ^[1-3]$ ]] || { echo "Error! Используйте 1, 2 или 3"; exit 1; }
}