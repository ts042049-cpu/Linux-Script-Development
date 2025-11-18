#!/bin/bash
# Author: Tushar saini
# Date: 14/11/25
# --- Script to automate downloads ---

# Check if target url argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target_url>"
    exit 1 # exit with an error status of 1 , abnormal termination
fi

# Initialise the file URL with the first argument, ensuring it's protected
url="$1"

# Predefined directory for downloads
download_dir="/home/tushar7357/downloads"
# Log file
log_file="/home/tushar7357/downloads/download_log.txt"

# Create directory if it doesn’t exist
mkdir -p "$download_dir"

# Extract filename from URL and clean up query strings
temp_filename=$(basename "$url")
filename=$(echo "$temp_filename" | sed 's/\?.*//')

# Download using wget with retries for robustness
echo "Downloading $filename ..."
wget -q --tries=3 -O "$download_dir/$filename" "$url"

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Download successful: $download_dir/$filename"
    echo "$(date): Downloaded $filename from $url" >> "$log_file"
else
    echo "Download failed!"
    echo "$(date): Failed to download $filename from $url" >> "$log_file"
fi
