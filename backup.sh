#!/bin/bash
# Author: Tushar saini
# Date: 13/11/25
# --- Script for  Backup of a Directory ---
# check if target directory argument is provided
if [ -z "$1" ]; then
echo "Usage: $0 <target_directory>"
exit 1 # exit with an error status of 1 , abnormal termination
fi
# path of the target directory (from argument)
target_path="$1"
# verify that target directory exists
if [ ! -d "$target_path" ]; then
echo "Error: Target directory '$target_path' does not exist."
exit 1 # exit with an error status of 1 , abnormal termination
fi
# path of the backup directory and logs
backup_path="/home/tushar7357/backup/directories"
# date and time used for folder name
timestamp=$(date +"%Y-%m-%d_%H:%M:%S")
#to ensure backup and log directories exist
mkdir -p "$backup_path"
# to create a timestamped backup folder
backup_folder="$backup_path/backup_$timestamp"
mkdir "$backup_folder"
#to copy the target directory recursively into the backup folder
cp -r "$target_path" "$backup_folder"
echo "Backup successful!"
echo "Files saved in: $backup_folder"

