#!/bin/bash

source ./proverka.sh
source ./functions.sh

if [ $# -ne 1 ]; then
    echo "Error! Укажите путь к директории, например: ./main.sh /var/log/"
    exit 1
fi

DIR="$1"

proverka_dir "$DIR" || exit 1

start_time=$(date +%s.%N)

analyze_directory "$DIR"

end_time=$(date +%s.%N)

duration=$(echo "$end_time - $start_time" | bc)

if [[ $duration == .* ]]; then
duration="0$duration"
fi

echo "Script execution time (in seconds) = $duration"

