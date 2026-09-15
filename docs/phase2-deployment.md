# Phase 2 - Linux Services and Application Deployment

## Overview

Configured and managed an Nginx web server using systemd, deployed a custom static website, performed service and configuration troubleshooting, analyzed logs, and tested backup and recovery procedures.

## Tasks Completed

- Installed and configured Nginx.
- Managed Nginx using systemctl.
- Practiced start, stop, restart, reload, enable, and disable operations.
- Verified service processes and port 80 using ss.
- Deployed a custom HTML page under /var/www/html.
- Explored Nginx sites-available and sites-enabled configuration.
- Worked with symbolic links used by Nginx.
- Added and verified a custom HTTP response header.
- Validated Nginx configuration using nginx -t.
- Used journalctl to inspect service logs.
- Analyzed Nginx access.log and error.log.
- Used tail, tail -f, grep, and pipes for log analysis.
- Troubleshot a stopped Nginx service.
- Diagnosed and repaired an invalid Nginx configuration.
- Diagnosed an HTTP 403 error caused by incorrect file permissions.
- Created a compressed website backup using tar and gzip.
- Verified backup contents and archive integrity.
- Simulated accidental modification of the website.
- Extracted and inspected the backup in a temporary recovery directory.
- Restored the original website from backup.
- Verified successful recovery with HTTP 200 OK.

## Final Verification

- Nginx service: active
- Nginx startup state: enabled
- Nginx configuration test: successful
- Website response: HTTP 200 OK
- Port: HTTP/80
- Custom response header: X-Lab-Server: Linux-SysAdmin-Lab

## Troubleshooting 

Detailed troubleshooting exercise are documented seperately in:

`docs/troubleshooting-notes.md`

## Configuration

A copy of the configured Nginx server block is stored in:

`configs/nginx-default.conf`


















