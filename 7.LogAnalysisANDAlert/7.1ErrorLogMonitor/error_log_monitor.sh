#!/bin/bash

LOG_FILE="/var/log/syslog"
STATE_FILE="temp/syslog_last_line"
REPORT_FILE="reports/error_report.txt"

OLD_LINE=$(cat "$STATE_FILE")

NEW_ERRORS=$(sudo tail -n +$((OLD_LINE + 1)) "$LOG_FILE" | grep -iE "error|warning|failed|denied")

ERROR_COUNT=$(echo "$NEW_ERRORS" | wc -l)

{
	echo "-------------------------"
	echo "Error Report - $(date)"
	echo "Total Error Found: $ERROR_COUNT"
	echo
	echo "$NEW_ERRORS"
} >> "$REPORT_FILE"
