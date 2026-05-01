#!/bin/bash

generator_logov() {
    local logi_dir="$1"
    local days="$2"
    for ((den=0; den<days; den++)); do
        local day=$(date -d "$den days ago" "+%Y-%m-%d")
        local filename="$logi_dir/vajniy_log_$den.log"
        local count=$((RANDOM % 901 + 100))

        echo "Generiruem $count zapisey v $filename"

        mapfile -t timestamps < <(generator_vremya "$day" "$count")

        for ((i=0; i<count; i++)); do
            ip=$(generator_ip)
            method=${METHODS[$RANDOM % ${#METHODS[@]}]}
            url=${URLS[$RANDOM % ${#URLS[@]}]}
            code=${CODES[$RANDOM % ${#CODES[@]}]}
            agent=${AGENTS[$RANDOM % ${#AGENTS[@]}]}
            size=$((RANDOM % 5000 + 200))
            times="${timestamps[$i]}"

            generator_strok "$ip" "$times" "$method" "$url" "$code" "$size" "$agent" "$filename"
        done
    done

    echo "Logs saved to $logi_dir"
}