#!/bin/bash
proverka_input() {
    if [ $# -ne 6 ]; then
        echo "Error! Ukajite 6 parametrov!"
        exit 1
    fi

[[ "$1" =~ ^/.* ]] || { echo "Error! Parametr 1 - absolyutniy put'"; exit 1; }
[[ "$2" =~ ^[0-9]+$ ]] || { echo "Error! Parametr 2 - chislo papok"; exit 1; }
[[ "$3" =~ ^[a-z]{1,7}$ ]] || { echo "Error! Parametr 3 - bukvi dlya papok"; exit 1; }
[[ "$4" =~ ^[0-9]+$ ]] || { echo "Error! Parametr 4 - kolichestvo faylov v papke"; exit 1; }
[[ "$5" =~ ^[a-z]{1,7}\.[a-z]{1,3}$ ]] || { echo "Error! Parametr 5 - formata imya.rasshirenie "; exit 1; }
[[ "$6" =~ ^[0-9]+kb$ ]] || { echo "Error! Parametr 6 - razmer faylov vida 88kb"; exit 1; }

}