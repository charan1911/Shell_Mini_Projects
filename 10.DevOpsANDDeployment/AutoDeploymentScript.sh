#!/bin/bash

# SMP root directory (parent of this script)
PROJECT_DIR="/mnt/c/Users/DELL/Desktop/SMP"

echo "Starting auto deployment of SMP..."

cd "$PROJECT_DIR" || exit 1

echo "Pulling latest changes from GitHub..."
git pull origin main

if [ $? -eq 0 ]; then
    echo "Auto deployment successful"

    powershell.exe -Command "Add-Type -AssemblyName PresentationFramework; \
    [System.Windows.MessageBox]::Show(
        'SMP project updated successfully',
        'Auto Deployment'
    )"
else
    echo "Auto deployment failed"

    powershell.exe -Command "Add-Type -AssemblyName PresentationFramework; \
    [System.Windows.MessageBox]::Show(
        'SMP deployment FAILED',
        'Auto Deployment Error'
    )"
fi

