#!/bin/bash
clean_by_time() {
    echo "Очистка по дате и времени создания"
    read -p "Введите начало (ГГГГ-ММ-ДД ЧЧ:ММ) : " START
    read -p "Введите конец (ГГГГ-ММ-ДД ЧЧ:ММ) : " END

    STARTT=$(date -d "$START" +%s 2>/dev/null)
    ENDD=$(date -d "$ENDD" +%s 2>/dev/null)

    if [ -z "$STARTT" ] || [ -z "$ENDD" ]; then
        echo "Error! Неверный формат даты"
        exit 1
    fi

    echo "Очистка по времени"

    find / -type f -newermt "$START" ! -newermt "$END" -print0 2>/dev/null |
    awk -v RS='\0' '/_[0-9]{6}\./ { print }' |
    while read -r file; do
        /usr/bin/rm -f "$file" && echo "The file $file is deleted"
    done

    find / -type d -newermt "$START" ! -newermt "$END" -print0 2>/dev/null |
    awk -v RS='\0' '/_[0-9]{6}$/ { print }' |
    while read -r dir; do
        /usr/bin/rm -rf "$dir" && echo "The directory $dir is deleted"
    done
}