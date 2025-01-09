#!/bin/bash
LOG="/tmp/restic-log"

# Source correct config for restic
source "/home/pc/restic/restic-setup.sh"

echo "Starting backupjob for restic at $(date '+%d/%m %H:%M:%S')" >> $LOG

# Run backup
restic backup /home

# Check if successful
if [ $? -eq 0 ];then
    result="Backup successful";
else
    result="Backup failed";
fi

# Store result in logfile
echo "$result at $(date '+%d/%m %H:%M:%S')" >> $LOG
