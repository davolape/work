#!/bin/bash
mode_uniq_ip() {
    echo "Все уникальные IP, встречающиеся в записях: "
    awk '{print $1}' $FILES | sort | uniq
}