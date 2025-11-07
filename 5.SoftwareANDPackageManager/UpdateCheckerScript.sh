#!/bin/bash

#Update Checker Script Starts
echo "Update Checker Script Starts"

#File Name
File="UpdateCheckerLOGS.txt"

#Check LOG File Exist or NOT
if [ -f "$File" ]; then
	echo "YES!,$File File Already Exist"
else
	echo "NO!, $File Not Exist"
	touch "$File"
	echo "$File File Created Successfully !!!"
fi

#Check Internet Connection
if ping -c 1 google.com &> /dev/null
then
	echo "Internect Connection: ACTIVE"
else
	echo "No Internet Connection. Try to Connect"
	exit 1
fi

#Check Updates Logic
echo "Checking Update Logic"

updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing" | xargs)

if [ -z "$updates" ]; then
    echo "All Packages are Up-to-Date!"
else
    echo "The Following Packages Can Be updated"
    echo "$updates"
    read -p "Do you want to upgrade now ? (y/n): " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        sudo apt upgrade -y
        echo "System Updated Successfully !!!"
    else
        echo "Update Skipped"
    fi
fi


#End of Script
echo "------------------------------------"
