proverka_dir() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error! $dir не является директорией"
        exit 1
    fi

    if [[ "$dir" != */ ]]; then
        echo "Error! путь должен заканчиваться символом /"
        exit 1
    fi
}