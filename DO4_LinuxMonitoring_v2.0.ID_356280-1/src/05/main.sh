#!/bin/bash

cd "$(dirname "$0")"

source ./config.sh

if [ $# -ne 1 ]; then
    echo "1 - Все записи, отсортированные по коду ответа"
    echo "2 - Все уникальные IP, встречающиеся в записях"
    echo "3 - Все запросы с ошибками (код ответа — 4хх или 5хх)"
    echo "4 - Все уникальные IP, которые встречаются среди ошибочных запросов"
    exit 1
fi

MODE="$1"

if ! [[ "$MODE" =~ ^[1-4]$ ]]; then 
    echo "Neverniy parametr. Ukajite 1, 2, 3 ili 4"
    exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
    echo "Papka logov ne naydena: "$LOG_DIR""
    exit 1
fi

FILES=$(find "$LOG_DIR" -type f -name "*.log")
if [ -z "$FILES" ]; then
    echo "V papke $LOG_DIR net logov"
    exit 1
fi

case "$MODE" in
  1) 
    source ./mode1.sh
    mode_sort_by_code $FILES 
    ;;
  2) 
    source ./mode2.sh
    mode_uniq_ip $FILES 
    ;;
  3) 
    source ./mode3.sh
    mode_errors $FILES 
    ;;
  4)
    source ./mode4.sh 
    mode_error_ip $FILES 
    ;;
esac

