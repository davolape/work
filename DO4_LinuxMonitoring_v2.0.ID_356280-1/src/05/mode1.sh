#!/bin/bash
mode_sort_by_code() {
    echo "Все записи, отсортированные по коду ответа:"
    awk '{print $0}' $FILES | sort -k9,9n
}