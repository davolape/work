#!/bin/bash

source check_space.sh
source createfil.sh
source gena.sh
source logii.sh
source proverka.sh

LOG_FILE="part1.log"
DATE=$(date +"%d%m%y")

proverka_input "$@"
if [ $? -ne 0 ]; then
    exit 1
fi

ABS_PATH=$1
DIR_COUNT=$2
DIR_BUKVI=$3
FILES_PER_DIR=$4
FILES_BUKVI=$5
FILES_SIZE_KB=$6

mkdir -p "$ABS_PATH"
echo "=============== START $(date) ==============" > "$LOG_FILE"

echo "DIR_BUKVI=$DIR_BUKVI, FILES_BUKVI=$FILES_BUKVI, FILES_SIZE_KB=$FILES_SIZE_KB"

for ((i=1; i<=DIR_COUNT; i++)); do
check_space
if [ $? -ne 0 ]; then
    echo "Vi dostigli limit svobodnogo mesta. Script is stopped"
    exit 1
fi

while true; do
    DIR_NAME=$(generator_imya "$DIR_BUKVI" 4 "$DATE")
    FULL_PATH_DIR="$ABS_PATH"/"$DIR_NAME"
    if [ ! -d "$FULL_PATH_DIR" ]; then
        break
    fi
done
mkdir "$FULL_PATH_DIR"
log_info "$FULL_PATH_DIR" "DIR"
create_f "$FULL_PATH_DIR" "$FILES_PER_DIR" "$FILES_BUKVI" "$DATE" "$FILES_SIZE_KB"
done
echo "=============== END $(date) ==============" >> "$LOG_FILE"
echo "Done"
