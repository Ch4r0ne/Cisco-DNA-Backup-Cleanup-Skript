# Cisco DNA Backup Cleanup Script / Cron Job

This repository provides a script and cron job configuration to automate the cleanup of old backups on a Cisco DNA Backup Ubuntu server.

You will find two scripts in this repository: `preview_delete_files.sh` and `delete_files.sh`. The `preview_delete_files.sh` script allows you to preview which files would be deleted without actually removing them, ensuring that the correct files are selected. Once you are satisfied with the results, you can use `delete_files.sh` to permanently delete the files. The cron job performs the same action as `delete_files.sh`. If you are satisfied with the preview results, you can set up the cron job from the "Quick Cron Job Setup" for automatic cleanup.


## Quick Cron Job Setup

To directly create a cron job that performs the cleanup task, run:

```sh
crontab -e
```

Then add the following line to schedule the cleanup script to run daily at 12:00 PM:

```sh
0 12 * * * find /mnt/automation/cluster1/*/ -maxdepth 1 -mindepth 1 -mtime +30 -exec rm -rf {} + >> /var/log/cisco-dna-backup-cleanup.log 2>&1
```

## Setup Instructions

### 1. Clone the Repository

```sh
git clone https://github.com/Ch4r0ne/Cisco-DNA-Backup-Cleanup-Skript.git
cd Cisco-DNA-Backup-Cleanup-Skript
```

### 2. Customize the Cleanup Script

Cisco DNA Backup Directory
```sh
BACKUP_DIR="/mnt/automation/cluster1"
```
Adjust the value to the desired duration in days
```sh
DAYS="+30"
```

Make the scripts executable:

```sh
chmod +x preview_delete_files.sh
```

### 3. Configure the Cron Job

Edit the crontab file to schedule the cleanup job. Run:

```sh
crontab -e
```

Add the following line to schedule the script to run daily at 12:00 PM:

```sh
0 12 * * * /path/to/your/delete_files.sh >> /var/log/cisco-dna-backup-cleanup.log 2>&1
```

### 4. Verify the Setup

Ensure the cron job is scheduled correctly:

```sh
crontab -l
```

You should see the entry for the cleanup script.

## Support

If you encounter any issues or have questions, please open an issue in this repository.

---

**Note:** Adjust the backup directory path and cron job schedule as needed to fit your environment.
