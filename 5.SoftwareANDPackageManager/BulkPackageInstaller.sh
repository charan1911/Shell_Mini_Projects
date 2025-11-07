#!/bin/bash
# ----------------------------------------
# Bulk Package Installer
# ----------------------------------------

LOG_FILE="/mnt/c/Users/DELL/Desktop/SMP/5.SoftwareANDPackageManager/BulkPackageInstaller_Log.txt"
PACKAGE_LIST="/mnt/c/Users/DELL/Desktop/SMP/5.SoftwareANDPackageManager/packages.txt"

# Create log file if it doesn't exist
touch "$LOG_FILE"

echo "----------------------------------------" >> "$LOG_FILE"
echo "Bulk Package Installation Started: $(date)" >> "$LOG_FILE"

# Check if package list file exists
if [ ! -f "$PACKAGE_LIST" ]; then
    echo "❌ Package list file not found: $PACKAGE_LIST" | tee -a "$LOG_FILE"
    exit 1
fi

# Loop through each package in the list
while IFS= read -r package; do
    if [ -z "$package" ]; then
        continue   # skip empty lines
    fi
    echo "Installing package: $package" | tee -a "$LOG_FILE"
    
    # Try installing package
    if sudo apt-get install -y "$package" >> "$LOG_FILE" 2>&1; then
        echo "✅ Installed: $package" >> "$LOG_FILE"
    else
        echo "❌ Failed to install: $package" >> "$LOG_FILE"
    fi
done < "$PACKAGE_LIST"

echo "Bulk Package Installation Completed: $(date)" >> "$LOG_FILE"
echo "Log saved at $LOG_FILE"

