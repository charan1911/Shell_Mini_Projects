#!/bin/bash
# ----------------------------------------
# Process Auto-Restart Script
# Path: /mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/ProcessAutoRestart
# Checks task1.sh and task2.sh, starts if not running
# Fully detached (won't stop if terminal closes)
# ----------------------------------------

# Base path
BASE_PATH="/mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/ProcessAutoRestart"

# -------------------
# Task 1
PROCESS1_NAME="task1.sh"
PROCESS1_PATH="$BASE_PATH/task1/$PROCESS1_NAME"

if ! pgrep -f "$PROCESS1_NAME" > /dev/null
then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $PROCESS1_NAME not running, starting..."
    setsid nohup bash "$PROCESS1_PATH" > "$BASE_PATH/task1/task1.log" 2>&1 < /dev/null &
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $PROCESS1_NAME is running ✅"
fi

# -------------------
# Task 2
PROCESS2_NAME="task2.sh"
PROCESS2_PATH="$BASE_PATH/task2/$PROCESS2_NAME"

if ! pgrep -f "$PROCESS2_NAME" > /dev/null
then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $PROCESS2_NAME not running, starting..."
    setsid nohup bash "$PROCESS2_PATH" > "$BASE_PATH/task2/task2.log" 2>&1 < /dev/null &
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $PROCESS2_NAME is running ✅"
fi

