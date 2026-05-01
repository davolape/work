#!/bin/bash
mode_errors() { 
    echo "Все запросы с ошибками: "
    awk '/^[45][0-9][0-9]$/' $FILES
}