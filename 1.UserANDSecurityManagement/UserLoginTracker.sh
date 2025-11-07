t hav#!/bin/bash
# ---- User Login Tracker ----
TRACK_DIR="/mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement"
USER_TEMP_FILE="$TRACK_DIR/.${USER}_login_info"
LogFile="$TRACK_DIR/session_log.txt"

# Ensure log file exists
touch "$LogFile"
chmod 666 "$LogFile"

if [ ! -f "$USER_TEMP_FILE" ]; then
    # LOGIN: store login time
    echo "$(date +%s)" > "$USER_TEMP_FILE"
    # echo "Login info recorded for $USER"   # optional
else
    # LOGOUT: read login time and calculate duration
    LoginEpoch=$(cat "$USER_TEMP_FILE")
    LogoutEpoch=$(date +%s)
    TotalTime=$((LogoutEpoch - LoginEpoch))
    Hours=$((TotalTime / 3600))
    Minutes=$(((TotalTime % 3600) / 60))
    Seconds=$((TotalTime % 60))

    # Other details
    userName=$(whoami)
    TerminalDetails=$(tty)
    LoginDate=$(date -d "@$LoginEpoch" +"%Y-%m-%d")
    LoginTime=$(date -d "@$LoginEpoch" +"%H:%M:%S")
    LogOutDate=$(date +"%Y-%m-%d")
    LogOutTime=$(date +"%H:%M:%S")
    userShell=$(grep "^$userName" /etc/passwd | cut -d: -f7)
    tty_name=$(tty)
    IdealTime=$(who -u | awk -v t="$tty_name" '$2==t {print $5}')
    SessionPID=$(who -u | awk -v t="$tty_name" '$2==t {print $6}')

    # Append to log
    echo -e "UserName:        $userName
UserShell:       $userShell
SessionPID:      $SessionPID
TerminalDetails: $TerminalDetails
LoginDate:       $LoginDate
LogOutDate:      $LogOutDate
LoginTime:       $LoginTime
LogOutTime:      $LogOutTime
IdealTime:       $IdealTime
Duration:        ${Hours}h:${Minutes}m:${Seconds}s
----------------------------------------" >> "$LogFile"

    # Remove temp file
    rm -f "$USER_TEMP_FILE"
fi

