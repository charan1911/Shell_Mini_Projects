#!/bin/bash
LOG_FILE="/mnt/c/Users/DELL/Desktop/SMP/4.AutomationANDScheduling/SystemUpdate_Log.txt"
EMAIL="gummadicharan37@gmail.com"

echo "----------------------------------------" >> "$LOG_FILE"
echo "System Update Started: $(date)" >> "$LOG_FILE"

if sudo apt update -y && sudo apt upgrade -y; then
    echo "✅ System updated successfully on $(date)" >> "$LOG_FILE"
    STATUS="System updated successfully ✅"
else
    echo "❌ Update failed on $(date)" >> "$LOG_FILE"
    STATUS="System update failed ❌"
fi

sudo apt autoremove -y && sudo apt autoclean -y >> "$LOG_FILE" 2>&1

notify-send "System Update Status" "$STATUS"
echo "$STATUS" | mail -s "System Update Status" -A "$LOG_FILE" "$EMAIL"

echo "Email sent to $EMAIL and log updated at $LOG_FILE"

