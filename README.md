# Cisco-DNA-Backup-Cleanup-Skript

0 12 * * * find /mnt/automation/cluster1/*/ -maxdepth 1 -mindepth 1 -mtime +40 -exec rm -rf {} + >> /var/log/ise-backup-cleanup.log 2>&1
