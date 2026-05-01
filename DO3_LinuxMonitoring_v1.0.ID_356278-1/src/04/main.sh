#!/bin/bash
CONFIG_FILE="./config.cfg"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

DEFAULT_COLUMN1_BACKGROUND=6
DEFAULT_COLUMN2_BACKGROUND=2
DEFAULT_COLUMN1_FONT_COLOR=1
DEFAULT_COLUMN2_FONT_COLOR=4

bg_label=${column1_background:-$DEFAULT_COLUMN1_BACKGROUND}
txt_label=${column1_font_color:-$DEFAULT_COLUMN1_FONT_COLOR}
bg_value=${column2_background:-$DEFAULT_COLUMN2_BACKGROUND}
txt_value=${column2_font_color:-$DEFAULT_COLUMN2_FONT_COLOR}

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

echo

echo "Column 1 background = ${column1_background:-default} ($(color_name ${column1_background:-6}))"
echo "Column 1 font color = ${column1_font_color:-default} ($(color_name ${column1_font_color:-1}))"
echo "Column 2 background = ${column2_background:-default} ($(color_name ${column2_background:-2}))"
echo "Column 2 font color = ${column2_font_color:-default} ($(color_name ${column2_font_color:-4}))"