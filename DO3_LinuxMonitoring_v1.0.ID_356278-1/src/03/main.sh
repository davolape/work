#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Error! Нужно указать 4 параметра (от 1 до 6), например: ./main.sh 1 2 3 4"
    exit 1
fi
bg_label=$1
txt_label=$2
bg_value=$3
txt_value=$4

for p in $bg_label $txt_label $bg_value $txt_value; do
    if ! [[ "$p" =~ ^[1-6]$ ]]; then
        echo "Error! Параметры должны быть цифрами от 1 до 6."
        exit 1
    fi
done

if [ "$bg_label" -eq "$txt_label" ]; then
    echo "Error! Цвет фона и цвет названий не должны совпадать"
    exit 1
fi

if [ "$bg_value" -eq "$txt_value" ]; then
    echo "Error! Цвет фона и цвет значений не должны совпадать"
    exit 1
fi

source ./colors.sh
source ./system_info.sh

get_sys_info
BG_LABEL=$(back_color "$bg_label")
TXT_LABEL=$(text_color "$txt_label")
BG_VALUE=$(back_color "$bg_value")
TXT_VALUE=$(text_color "$txt_value")

print_line() {
    local name="$1"
    local value="$2"
    printf "\e[%s;%sm%-20s\e[0m = \e[%s;%sm%s\e[0m\n" \
        "$TXT_LABEL" "$BG_LABEL" "$name" "$BG_VALUE" "$TXT_VALUE" "$value"
}

print_line "HOSTNAME" "$HOSTNAME"
print_line "TIMEZONE" "$TIMEZONE"
print_line "USER" "$USER"
print_line "OS" "$OS"
print_line "DATE" "$DATE"
print_line "UPTIME" "$UPTIME"
print_line "UPTIME_SEC" "$UPTIME_SEC"
print_line "IP" "$IP"
print_line "MASK" "$MASK"
print_line "GATEWAY" "$GATEWAY"
print_line "RAM_TOTAL" "$RAM_TOTAL"
print_line "RAM_USED" "$RAM_USED"
print_line "RAM_FREE" "$RAM_FREE"
print_line "SPACE_ROOT" "$SPACE_ROOT"
print_line "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
print_line "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"