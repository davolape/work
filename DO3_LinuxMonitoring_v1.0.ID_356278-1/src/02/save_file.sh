save_file() {
    echo
    read -p "Do you want to save this data to a file? (Y/N): " ANSWER
    if [[ "$ANSWER" == "Y" || "$ANSWER" == "y" ]]; then
        FILENAME="$(date +"%d_%m_%y_%H_%M_%S").status"
        echo "$1" > "$FILENAME"
        echo  "Success! Data is saved!"
    else
        echo "Error! Data isn't saved"
    fi
}