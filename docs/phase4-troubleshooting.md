# Linux System Administration Lab - Troubleshooting Notes

## Incident 1: Nginx Service Stopped


**Symptom:**
The website was unreachable and `curl` could not connect to localhost on port 80.


**Investigation:**
- Checked Nginx service status using `systemctl status nginx`.
- Checked service logs using `journalctl -u nginx`.
- Checked port 80 using `ss`.


**Root Cause:**
The Nginx service was stopped, so no process was listening on port 80.


**Resolution:**
Started Nginx using `sudo systemctl start nginx`.


**Verification:**
- Confirmed Nginx was active.
- confirmed port 80 was listening.
- Confirmed the website returned HTTP 200 OK.


## Incident 2: Nginx Configuration Error


**Symptom:**
Nginx failed to start.

**Investigation:**
- Checked `systemctl status nginx`.
- Inspected logs with `journalctl -u nginx`.
- Validated the configuration using `sudo nginx -t`.

**Root Case:**
The `add_header` directive in the Nginx site configuration was missing a semicolon.

**Resolution:**
Corrected the configuration and validated it again with `sudo nginx -t`, then started Nginx.

**Verification:**
- Configured test succeeded.
- Nginx became active.
- Port 80 was listening.
- Website returned HTTP 200 OK.


## Incident 3: Web File Permission Error


**Symptoms:**
The website returned HTTP 403 Forbidden while Nginx remained active.

**Investigation:**
- Confirmed Nginx was active.
- Checked `/var/log/nginx/error.log`.
- Found `Permission denied` for `/var/www/html/index.html`.
- Checked the file permission.

**Root Cause:**
`index.html` had permission `600` (`rw-------`), preventing the Nginx worker from reading the file.

**Resolution:**
Restored the file permissions using:

`sudo chmod 644 /var/www/html/index.html`

**Verification:**
The website returned HTTP 200 OK again without restarting Nginx.
