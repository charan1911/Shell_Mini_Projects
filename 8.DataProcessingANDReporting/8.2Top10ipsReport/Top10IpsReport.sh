#!/bin/bash

Log_File="/mnt/c/Users/DELL/Desktop/SMP/8.DataProcessingANDReporting/8.2Top10ipsReport/Top10IpsReportLog.txt"

echo "========== $(date) ==========" >> "$Log_File"

grep -oE '\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b' /var/log/syslog \
	| sort | uniq -c | sort -nr | head -10 >> "$Log_File"

echo "" >> "$Log_File"

