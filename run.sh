#!/bin/bash

VENV_PATH="./.venv/bin/activate"
MAX_RESTARTS=3
RESTART_COUNT=0
LOG_FILE="run.log"

run_myblink() {
    source "$VENV_PATH"
    python myblink.py >> "$LOG_FILE" 2>&1
}

while [ $RESTART_COUNT -lt $MAX_RESTARTS ]; do
    echo "Starting myblink.py (Attempt $((RESTART_COUNT + 1)) of $MAX_RESTARTS)" >> "$LOG_FILE"
    run_myblink

    if [ $? -ne 0 ]; then
        echo "myblink.py exited with an error." >> "$LOG_FILE"
    else
        echo "myblink.py completed successfully." >> "$LOG_FILE"
        break
    fi

    RESTART_COUNT=$((RESTART_COUNT + 1))

    sleep 1
done

if [ $RESTART_COUNT -eq $MAX_RESTARTS ]; then
    echo "Reached maximum restart attempts for myblink.py" >> "$LOG_FILE"
fi