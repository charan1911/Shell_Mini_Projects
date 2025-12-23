#!/bin/bash

# ================================
# FILE TRANSFER AUTOMATION SCRIPT
# ================================

# -------- SOURCE FOLDER (LOCAL) --------
# Folder A contains files like 1.txt, 2.txt, 12.txt
SOURCE="/mnt/c/Users/DELL/Desktop/SMP/6.NetworkingANDConnectivity/file_transfer/A/"

# -------- DESTINATION FOLDER (LOCAL) --------
# Folder B is the destination on the SAME laptop
DEST="/mnt/c/Users/DELL/Desktop/SMP/6.NetworkingANDConnectivity/file_transfer/B/"

# -------- LOG FILE --------
LOG="/mnt/c/Users/DELL/Desktop/SMP/6.NetworkingANDConnectivity/file_transfer/transfer.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG")"

echo "----------------------------------------" >> "$LOG"
echo "Transfer started at $(date)" >> "$LOG"

# -------- ACTUAL TRANSFER (LOCAL) --------
# rsync used for reliable file transfer
rsync -r --no-times --inplace "$SOURCE" "$DEST" >> "$LOG" 2>&1

# -------- STATUS CHECK --------
if [ $? -eq 0 ]; then
    echo "Transfer successful at $(date)" >> "$LOG"
else
    echo "Transfer failed at $(date)" >> "$LOG"
fi

# =========================================================
# REMOTE TRANSFER (LAPTOP TO LAPTOP) — COMMENTED ON PURPOSE
# =========================================================
# This DOES NOT WORK with WSL private IPs (172.x.x.x)
# Requires REAL Linux or Cloud server with public IP
#
# Example (ONLY THEORY / CLOUD / REAL LINUX):
# rsync -r --no-times --inplace "$SOURCE" \
# charan@PUBLIC_IP:/home/charan/Dummy/
#
# =========================================================

