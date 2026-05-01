#!/bin/bash
clean_by_mask() {
    echo "Очистка по маске имени"
    read -p "Введите маску (например, azazazzz_271125): " MASK

    if [[ ! "$MASK" =~ ^[a-zA-Z]{5,7}_[0-9]{6}$ ]]; then
        echo "Error! Неверный формат маски"
        exit 1
    fi

    echo "Очистка по маске: $MASK"

    find / -type f -name "*${MASK}*" 2>/dev/null | while read -r file; do
        /usr/bin/rm -f "$file" && echo "The file $file is deleted"
    done

    find / -type d -name "*${MASK}*" 2>/dev/null | while read -r dir; do
        /usr/bin/rm -rf "$dir" && echo "The directory $dir is deleted"
    done

}