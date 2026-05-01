#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/check_space.sh"
source "$SCRIPT_DIR/gena.sh"
source "$SCRIPT_DIR/createfile.sh"
source "$SCRIPT_DIR/logii.sh"
source "$SCRIPT_DIR/proverka.sh"

LOG_FILE="part2.log"
DATE=$(date +"%d%m%y")

proverka_input "$@"
if [ $? -ne 0 ]; then
    exit 1
fi

DIR_BUKVI=$1
FILES_BUKVI=$2
FILES_SIZE_MB=$3
BASE_DIRS=$(find / -type d -mindepth 1 -maxdepth 3 2>/dev/null | grep -vE '/(bin|sbin|proc|sys|dev|run|boot|snap|tmp)' | shuf)

for dir in $BASE_DIRS; do
    if [ -w "$dir" ]; then
        ABS_PATH="$dir"
        break
    fi
done

if [ -z "$ABS_PATH" ]; then
    echo "Error! Не удалось найти подходящую директорию"
    exit 1
fi

start_time=$(date +%s)
echo "=============== START $(date) ==============" > "$LOG_FILE"

echo "DIR_BUKVI=$DIR_BUKVI, FILES_BUKVI=$FILES_BUKVI, FILES_SIZE_MB=$FILES_SIZE_MB" >> "$LOG_FILE"

MAX_DEPTH=100
DEPTH=0

for BASE in $BASE_DIRS; do
    if [ ! -w "$BASE" ]; then
        continue
    fi

    CURRENT_PATH="$BASE"
    echo "Используем базовую директорию: $CURRENT_PATH"

    while check_space && [ "$DEPTH" -lt "$MAX_DEPTH" ]; do
        MAX_TRIES=100
        TRIES=0

        while true; do
            LEN=$((5 + RANDOM % 3))
            DIR_NAME=$(generator_imya "$DIR_BUKVI" "$LEN" "$DATE")
            FULL_PATH_DIR="$CURRENT_PATH/$DIR_NAME"

            if [[ "$FULL_PATH_DIR" != *"/bin/"* && "$FULL_PATH_DIR" != *"/sbin/"* && ! -d "$FULL_PATH_DIR" ]]; then
                break
            fi

            TRIES=$((TRIES + 1))
            if [ "$TRIES" -ge "$MAX_TRIES" ]; then
                echo "Error! Не удалось сгенерировать уникальное имя папки после $MAX_TRIES попыток"
                exit 1
            fi
        done

        mkdir "$FULL_PATH_DIR"
        log_vhod "$FULL_PATH_DIR" "DIR"
        FILE_COUNT=$((1 + RANDOM % 10))
        create_f "$FULL_PATH_DIR" "$FILE_COUNT" "$FILES_BUKVI" "$DATE" "$FILES_SIZE_MB"
        CURRENT_PATH="$FULL_PATH_DIR"
        DEPTH=$((DEPTH + 1))
        if [ ${#FULL_PATH_DIR} -ge 4000 ]; then
            echo "Error! путь слишком длинный ($FULL_PATH_DIR)"
            break
        fi

    done

done
echo "Error! Hедостаточно места или ошибка"

end_time=$(date +%s)
obshee=$((end_time - start_time))

log_vse "Начало скрипта: $(date -d "@$start_time")"
log_vse "Конец скрипта: $(date -d "@$end_time")"
log_vse "Время выполнения скрипта: ${obshee}"

echo "=============== END $(date) ==============" >> "$LOG_FILE"
echo "Done"
