#!/bin/bash

clean_by_log() {
    LOG_FILE="part2.log"
    if [ ! -f "$LOG_FILE" ]; then
        echo "Error! Log-файл не найден"
        exit 1
    fi
    echo "Очистка запущена ..."

    grep -E "DIR|FILE" "$LOG_FILE" | while read -r DATE TIME TYPE PATH REST; do
        if [ "$TYPE" == "DIR" ]; then
            /usr/bin/rm -rf "$PATH" && echo "The directory $PATH was deleted"
        elif [ "$TYPE" == "FILE" ]; then
            /usr/bin/rm -f "$PATH" && echo "The file $PATH was deleted"
        fi
    done
}
