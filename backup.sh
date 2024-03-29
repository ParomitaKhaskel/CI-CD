#!/bin/bash

# [TASK 1]

# Setting the target directory
targetDirectory="/path/to/source"
# Setting the destination directory
destinationDirectory="/path/to/destination"

# [TASK 2]

# Print the target directory path to the user
echo "Target directory: $targetDirectory"
# Print the destination directory path to the user
echo "Destination directory: $destinationDirectory"

# [TASK 3]

# Set the current timestamp in seconds
currentTS=$(date +%s)

# [TASK 4]

# Set the backup file name to the correct value
backupFileName="backup_$currentTS.tar.gz"

# [TASK 5]

# Define origAbsPath variable
origAbsPath=$(realpath "$targetDirectory")

# [TASK 6]

# Define destAbsPath variable
destAbsPath=$(realpath "$destinationDirectory")

# [TASK 7]

# Change current working directory to targetDirectory
cd "$targetDirectory" || exit

# [TASK 8]

# Set yesterdayTS to the timestamp of 24 hours before currentTS
yesterdayTS=$(date -d 'yesterday' +%s)

# [TASK 9]

# Put the correct command to list all files and directories within the $() brackets
toBackup=($(find . -type f -newermt "$(date -d @$yesterdayTS)" ))

# [TASK 10]

# Code in the if statement to check if file $file was updated within the past day
if [ "$file" -nt "$(date -d @$yesterdayTS)" ]; then
    # Add the name of the file that was updated within the past day to the toBackup array
    toBackup+=("$file")
fi

# [TASK 11]

# Add the name of the file that was updated within the past day to the toBackup array
toBackup+=("$file")

# [TASK 12]

# Create the backup file in the current directory which is an archived and compressed file containing all files in toBackup
tar -czf "$backupFileName" "${toBackup[@]}"

# [TASK 13]

# Move the backup file created in task 12 to the destination path
mv "$backupFileName" "$destinationDirectory"
