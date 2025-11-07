#!/bin/bash
# ----------------------------------------
# Startup Script - System Initialization Info
# ----------------------------------------

# Log file path
LOG_FILE="/mnt/c/Users/DELL/Desktop/SMP/4.AutomationANDScheduling/Startup_Log.txt"

# Create log directory if it doesn't exist
mkdir -p "$(dirname "$LOG_FILE")"

echo "----------------------------------------" >> "$LOG_FILE"
echo "System Startup - $(date)" >> "$LOG_FILE"

# System uptime
echo "Uptime: $(uptime -p)" >> "$LOG_FILE"

# Network status
if ping -c 1 8.8.8.8 &> /dev/null; then
    echo "Network: Connected ✅" >> "$LOG_FILE"
else
    echo "Network: Disconnected ❌" >> "$LOG_FILE"
fi

# Running services (top 10)
echo "Active services (top 10):" >> "$LOG_FILE"
systemctl list-units --type=service --state=running | head -10 >> "$LOG_FILE"

# Disk usage
echo "Disk Usage:" >> "$LOG_FILE"
df -h >> "$LOG_FILE"

# CPU and RAM usage
echo "CPU & Memory Usage:" >> "$LOG_FILE"
top -b -n1 | head -5 >> "$LOG_FILE"

# Optional notification (won't work in WSL, but safe to leave)
# notify-send "System Startup" "Startup checks completed ✅ (Log saved)"

echo "Startup script completed at $(date)" >> "$LOG_FILE"

# Optional: send email if you have mail configured
# echo "System started on $(date)" | mail -s "Startup Notification" "$EMAIL"

echo "Log saved at $LOG_FILE"

