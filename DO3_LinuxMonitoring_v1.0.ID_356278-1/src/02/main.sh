#!/bin/bash

source ./system_info.sh
source ./save_file.sh

INFO=$(get_sys_info)

echo "$INFO"

save_file "$INFO"