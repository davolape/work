#!/bin/bash

analyze_directory() {
    local dir="$1"

    echo "Total number of folders (including all nested ones) = $(find $dir -type d 2>/dev/null | wc -l)"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    du -h "$dir" 2>/dev/null | sort -rh | head -n 5  | awk '{print NR " - " $2 ", " $1 }'
    echo "Total number of files = $(find "$dir" -type f 2>/dev/null | wc -l)"

    local conf_files=$(find "$dir" -type f -name '*.conf' 2>/dev/null | wc -l)
    local text_files=$(find "$dir" -type f -name '*.txt' 2>/dev/null | wc -l)
    local exec_files=$(find "$dir" -type f -executable 2>/dev/null | wc -l)
    local log_files=$(find "$dir" -type f -name '*.log' 2>/dev/null | wc -l)
    local arch_files=$(find "$dir" -type f \( -name "*.tar" -o -name "*.gz" -o -name "*.zip" -o -name "*.bz2" -o -name "*.xz" \) 2>/dev/null | wc -l)
    local links=$(find "$dir" -type l 2>/dev/null | wc -l)

    echo "Number of: "
    echo "Configuration files (with the .conf extension) = $conf_files"
    echo "Text files = $text_files"
    echo "Executable files = $exec_files"
    echo "Log files (with the .log extension) = $log_files"
    echo "Archive files = $arch_files"
    echo "Symbolic links = $links"

    top_files=$(find "$dir" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10)
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
    i=1
    while read -r line; do
        path=$(echo "$line" | awk '{print $2}')
        size=$(echo "$line" | awk '{print $1}')
        type=$(file -b --mime-type "$path")
        echo "$i - $path, $size, $type"
        ((i++))
    done <<< "$top_files"

    top_exec=$(find "$dir" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -n 10)
    echo "TOP 10 executable files of maximum size arranged in descending order (path, size and MD% hash of file): "
    i=1
    while read -r line; do
        path=$(echo "$line" | awk '{print $2}')
        size=$(echo "$line" | awk '{print $1}')
        md5=$(md5sum "$path" 2>/dev/null | awk '{print $1}')
        echo "$i - $path, $size, $md5"
        ((i++))
    done <<< "$top_exec"
}