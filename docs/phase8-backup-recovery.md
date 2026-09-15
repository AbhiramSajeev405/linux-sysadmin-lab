# Phase 8 - Backup and Recovery

## Objective

The objective of this phase was to practice Linux backup and recovery procedures, verify backup integrity, test restoration, and automate regular backups of the Nginx website.

## Backup Target

The Nginx website files located at:

`/var/www/html`

were used as the backup target.

Backups were stored in:

`/home/abhiram/linux-sysadmin-lab/backups`

## Manual Backup Verification

An existing compressed backup archive was inspected using:

`tar -tzvf ~/linux-sysadmin-lab/backups/nginx-website-backup.tar.gz`

This verified that the archive contained the expected Nginx website files, including `index.html`.

## Restore Test

A seperate restore directory was created to test recovery without affecting the live Nginx website:

`~/linux-sysadmin-lab/backups/restore-test`

The backup was extracted into this directory and the restored `index.html` file was inspected to confirm that the expected website content could be recovered.

## Backup Integrity Verification

SHA-256 was used to generate and verify a checksum for the backup archive.

The checksum was verified using:

`sha256sum -c nginx-website-backup.sha256`

The result returned `OK`, confirming that the archive matched its recorded SHA-256 checksum.

## Automated Backup Script

A bash script named `nginx-backup.sh` was created in the `scripts` directory to automate the backup process.

The script:

- Generates a timestamp for each backup.
- Creates a compressed `.tar.gz` archive of `/var/www/html`.
- Checks the exit status of the backup command to determine whether the operation succeeded or failed.
- Generates a SHA-256 checksum for every successfully created backup.
- Uses timestamped filenames to prevent previous backups from being overwritten.

The script was made executable using:

`chmod +x scripts/nginx-backup.sh`

The script was executed manually and successfully created a timestamped Nginx backup and its corresponding SHA-256 checksum file.
## Automated Backup Schedule

The backup script was scheduled using cron:

`0 18 * * * /home/abhiram/linux-sysadmin-lab/scripts/nginx-backup.sh >> /home/abhiram/linux-sysadmin-lab/docs/backup.log 2>&1`

This schedule runs the backup script every day at 18:00 (6:00 PM).

Standard output and error output are appended to `backup.log` to maintain a record of backup execution.

## Verification

The automated backup was verified by:

- Confirming that the `.tar.gz` archive was created.
- Listing the contents of the archive using `tar`.
- Confirming that the expected Nginx website files were present.
- Verifying the automatically generated SHA-256 checksum using `sha256sum -c`.
- Confirming that the checksum verification returned `OK`.

## WSL2 Limitation

Because this lab is running in WSL2, scheduled cron jobs depend on the WSL Linux environment being active. In a continuously running Linux server environment, cron would operate as a persistent scheduled service.

## Outcome

This phase demonstrated practical backup and recovery administration, including compressed backups, restoration testing, integrity verification, Bash-based backup automation, logging, and scheduled backups using cron.
