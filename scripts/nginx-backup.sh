#!/bin/bash


BACKUP_DIR="$HOME/linux-sysadmin-lab/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/nginx-backup-$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" /var/www/html 

if [ $? -eq 0 ]; then
	sha256sum "$BACKUP_FILE" > "$BACKUP_FILE.sha256"
	echo "Backup created successfully: $BACKUP_FILE"
else
	echo "ERROR: Backup failed."
	exit 1
fi

