#!/bin/bash

#Output file
OUTPUT_FILE="shutdownLogs.txt"

#Header to the output file
echo "Windows Shutdown and Reboot Logs" > $OUTPUT_FILE
echo "===============================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

#PowerShell command
POWERSHELL_COMMAND="Get-EventLog -LogName System | Where-Object { \$_.EventID -in 1074, 6006, 6008, 6009 } | Select-Object -Property TimeGenerated, EntryType, Message | Sort-Object TimeGenerated"

#Run PowerShell command and append the output to the file
powershell -Command "$POWERSHELL_COMMAND" >> $OUTPUT_FILE

#Completion message
echo "Written to $OUTPUT_FILE"
