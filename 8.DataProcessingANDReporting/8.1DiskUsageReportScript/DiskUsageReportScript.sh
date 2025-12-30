#!/bin/bash

Threshold=50
Log_File="/mnt/c/Users/DELL/Desktop/SMP/8.DataProcessingANDReporting/8.1DiskUsageReportScript/DiskUsageReport.txt"

echo "==== $(date) ====" >> $Log_File

Check_Disk() {
	Data=$(df -h | awk -v m="$1" '$NF==m')

	FileSystem=$(echo "$Data" | awk '{print $1}')
	Total=$(echo "$Data" | awk '{print $2}')
	Used=$(echo "$Data" | awk '{print $3}')
	Free=$(echo "$Data" | awk '{print $4}')
	Percentage=$(echo "$Data" | awk '{print $5}')

	Usage=${Percentage%\%}

	if [ "$Usage" -ge "$Threshold" ]; then
		Status="WARNING"
	else
		Status="OK"
	fi

	echo "FileSystem:$FileSystem Total:$Total Used:$Used Free:$Free Percentage:$Percentage Status:$Status" >> "$Log_File"
}


Check_Disk '/'
Check_Disk '/mnt/c'
Check_Disk '/mnt/d'
