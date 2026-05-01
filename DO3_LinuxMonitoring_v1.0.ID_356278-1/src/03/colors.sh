back_color() {
    case $1 in
        1) echo "47" ;;
        2) echo "41" ;;
        3) echo "42" ;;
        4) echo "44" ;;
        5) echo "45" ;;
        6) echo "40" ;;
    esac
}

text_color() {
    case $1 in
        1) echo "37" ;;
        2) echo "31" ;;
        3) echo "32" ;;
        4) echo "34" ;;
        5) echo "35" ;;
        6) echo "30" ;;
    esac
}