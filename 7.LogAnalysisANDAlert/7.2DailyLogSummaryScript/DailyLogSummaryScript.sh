#!/bin/bash

echo "--------------------------------------------------"

Date=$(date)
Today_Date=$(date "+%Y-%m-%d")
Yesterday=$(date -d "yesterday" "+%Y-%m-%d")

echo "Date: $Date"
echo "Today Date: $Today_Date"
echo " "

Source_Name="/var/log/syslog"
echo "Source Name: $Source_Name"
echo " "

#Log_Entities_Count=$(wc -l < /var/log/syslog) It give All Log's Not Today
Log_Entities_Count=$(grep "^$Today_Date" /var/log/syslog | wc -l)
echo "Log Entities Count: $Log_Entities_Count"
echo " "

#Error_Count=$(grep -i "error" /var/log/syslog | wc -l)
Error_Count=$(grep "^$Today_Date" /var/log/syslog | grep -i "error" | wc -l)
echo "Error Count: $Error_Count"
echo " "

#Warning_Count=$(grep -i "warn" /var/log/syslog | wc -l)
Warning_Count=$(grep "^$Today_Date" /var/log/syslog | grep -i "warn" |wc -l)
echo "Warning_Count: $Warning_Count"
echo " "

#Failed_Count=$(grep -i "failed" /var/log/syslog | wc -l)
Failed_Count=$(grep "^$Today_Date" /var/log/syslog | grep -i "failed" | wc -l)
echo "Failed Count: $Failed_Count"
echo ' '

Successful_Login_Count_Normal=$(grep "^$Today_Date" /var/log/syslog | grep -i "accepted" | wc -l)
Successful_Login_Count_Ubuntu=$(grep "^$Today_Date" /var/log/auth.log | grep -i "accepted" |wc -l)
echo "(Normal) Successful Login's Count: $Successful_Login_Count_Normal"
echo "(Ubuntu) Successful Login's Count: $Successful_Login_Count_Ubuntu"
echo " "

Failed_Login_Count_Normal=$(grep "^$Today_Date" /var/log/syslog | grep -i "failed" | wc -l)
Failed_Login_Count_Ubuntu=$(grep "^$Today_Date" /var/log/auth.log | grep -i "failed" | wc -l)
echo "(Normal) Failed Login's Count: $Failed_Login_Count_Normal"
echo "(Ubuntu) Failed Login's Count: $Failed_Login_Count_Ubuntu"
echo " "

Yesterday_Logs_Count=$(grep "^$Yesterday" /var/log/syslog | wc -l)
echo "Comparsion Logs: $Log_Entities_Count   -   $Yesterday_Logs_Count"
# LOGIC FOR LOGS's ERROR
if [ "$Log_Entities_Count" -gt "$Yesterday_Logs_Count" ]; then
       echo "ALERT: ERROR's Have Been Increased Since Yesterday !!!!"
fi
echo " "


Today=$(date "+%Y-%m-%d")

peak_hour=$(grep "^$Today" /var/log/syslog \
 | cut -d'T' -f2 \
 | cut -d':' -f1 \
 | sort \
 | uniq -c \
 | sort -nr \
 | head -1)

echo "Peak hour today: $peak_hour"
echo " "

echo "--- TOP 3 REPEATED ERROR MESSAGE's ---"
grep -i "error" /var/log/syslog | sort | uniq -c | sort -nr | head -3
echo '--------------------------------------'

echo "--- Sudo Command Usage: Who When -----"
grep "sudo:" /var/log/auth.log | awk '{print $1, $2, $3, $5}'
echo "--------------------------------------"

