#!/bin/bash

# === Automated Full Backup Script ===

# Source and destination paths
SOURCE="/mnt/c/Users/DELL/Desktop/SMP/BackupANDFileManagement/data"
DESTINATION="/mnt/c/Users/DELL/Desktop/SMP/BackupANDFileManagement/backups"

# Create destination folder if not exist
mkdir -p "$DESTINATION"

# Create timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup file name
backup_name="full_backup_$timestamp.tar.gz"

# Create the backup
tar -czf "$DESTINATION/$backup_name" "$SOURCE"

# Log the backup
echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup created: $backup_name" >> "$DESTINATION/backup_log.txt"

echo "✅ Full Backup Completed: $backup_name"

