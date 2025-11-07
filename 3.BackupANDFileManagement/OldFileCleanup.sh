#!/bin/bash

# === Old File Cleanup Script (10-Minute Test Version) ===

# Target folder
TARGET="/mnt/c/Users/DELL/Desktop/SMP/BackupANDFileManagement/backups"

# Log file
LOGFILE="$TARGET/cleanup_log.txt"

# Find and delete files older than 10 minutes
find "$TARGET" -type f -mmin +10 -delete

# Log the cleanup
echo "$(date +"%Y-%m-%d %H:%M:%S") - Deleted files older than 10 minutes in $TARGET" >> "$LOGFILE"

echo "🧹 Cleanup Completed: Files older than 10 minutes deleted."

