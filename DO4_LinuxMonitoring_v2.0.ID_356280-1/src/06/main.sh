#!/bin/bash

LOG_PATH="/home/davolape/DO4_LinuxMonitoring_v2.0.ID_356280-1/src/04/logs/*.log"

OUTPUT="report.html"

if compgen -G "$LOG_PATH" > /dev/null; then
    echo "Generating GoAccess report..."

    goaccess $LOG_PATH \
        --log-format=COMBINED \
        --output="$OUTPUT"

    if [ $? -eq 0 ]; then
        echo "Report created: $OUTPUT"
        echo "Open it in your browser to view the dashboard."
    else
        echo "GoAccess failed to generate the report."
        exit 2
    fi
else
    echo "No log files found in /home/davolape/DO4_LinuxMonitoring_v2.0.ID_356280-1/src/04/logs"
    exit 1
fi
