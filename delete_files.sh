#!/bin/bash

# Cisco DNA Backup directory
BASE_DIR="/mnt/automation/cluster1"

# Search only the first subfolders of the base directory
for dir in "$BASE_DIR"/*/; do
    echo "Lösche Dateien und Ordner in Verzeichnis: $dir"
    # Find and delete files and folders older than 30 days
    find "$dir" -maxdepth 1 -mindepth 1 -mtime +30 -exec rm -rf {} \;
done
