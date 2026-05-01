#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/proverka.sh"

VIBOR=$1
proverka_input "$VIBOR"

case "$VIBOR" in
    1)
        source "$SCRIPT_DIR/cleanlog.sh"
        clean_by_log
        ;;
    2)
        source "$SCRIPT_DIR/cleantime.sh"
        clean_by_time
        ;;
    3)
        source "$SCRIPT_DIR/cleanmask.sh"
        clean_by_mask
        ;;
esac

echo "Cleaning finished"