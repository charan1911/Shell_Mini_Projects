#!/bin/bash

PROCESS="sleep"

if ! pgrep "$PROCESS" > /dev/null
then
    powershell.exe -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('ALERT: sleep process is NOT running','Service Health Alert')"
fi

