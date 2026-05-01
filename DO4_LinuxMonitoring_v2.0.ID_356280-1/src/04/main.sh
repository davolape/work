#!/bin/bash

cd "$(dirname "$0")"

source ./configi.sh
source ./functions.sh
source ./gena.sh

LOG_DIR="./logs"
DAYS=5

if [ "$#" -gt 1 ]; then
    echo "Error! Using: ./main.sh [dir for logs]"
    exit 1
fi

if [ "$1" ]; then
    LOG_DIR="$1"
fi

mkdir -p "$LOG_DIR" || { echo "Ne udalos' sozdat' papku $LOG_DIR"; exit 1; }
generator_logov "$LOG_DIR" "$DAYS"

