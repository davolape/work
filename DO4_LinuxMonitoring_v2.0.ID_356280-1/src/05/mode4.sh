#!/bin/bash
mode_error_ip() { 
    echo "Все уникальные IP, которые встречаются среди ошибочных запросов: "
    awk '$9 ~ /^[45][0-9][0-9]$/ {print $1}' $FILES | sort | uniq
}