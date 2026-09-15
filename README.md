# Linux System Administration & Security Lab

A hands-on Linux system administration project built in Ubuntu on WSL2 to practice core tasks performed by a Junior Linux System Administrator.

The project covers user and permission management, Nginx service administration, system monitoring, troubleshooting, networking, firewall configuration, SSH security, patch management, system hardening, backup and recovery, and task automation.

## Environment

- Ubuntu Linux on WSL2
- systemd
- Nginx
- OpenSSH
- UFW
- APT
- Bash
- Cron
- OpenSSL

## Key Skills Demonstrated

- Linux user and group administration
- File ownership and permissions
- Shared directory access control with setgid
- Nginx installation, configuration, and service management
- Linux process, port, and service inspection
- System resource monitoring
- Bash scripting
- Cron job scheduling
- Linux log analysis and troubleshooting
- TCP/IP and DNS troubleshooting
- UFW firewall configuration
- SSH service administration
- SSH key-based authentication
- SSH security hardening
- Linux package and security update management
- Post-patch service verification
- Privileged account auditing
- Backup creation and restoration
- SHA-256 backup integrity verification
- Automated and scheduled backups

## Project Phases

### Phase 1 - Users, Groups and Permissions

Configured Linux users and groups and practiced ownership and permission management. Created a shared application directory under `/srv`, controlled access using group permissions, and used setgid to maintain group ownership for newly created files.

### Phase 2 - Nginx Deployment and Service Management

Installed and configured Nginx as a web server. Deployed a custom HTML page, managed the service with systemd, inspected the Nginx configuration, and verified the web server using HTTP requests.

### Phase 3 - System Monitoring and Automation

Created a Bash-based system health monitoring script that reports hostname, date, uptime, memory usage, disk usage, system load, Nginx status, and failed systemd services. Scheduled automated health reports using cron.

### Phase 4 - Logs and Troubleshooting

Practiced troubleshooting using system and service logs. Inspected Nginx and authentication-related logs and used Linux diagnostic commands to investigate service and system behavior.

### Phase 5 - Networking and Firewall

Inspected network interfaces, IP addressing, routing, DNS resolution, listening ports, and network connectivity. Configured UFW with rules allowing Nginx HTTP and OpenSSH traffic while maintaining a default deny policy for incoming connections.

### Phase 6 - SSH and Server Security

Configured and tested OpenSSH. Generated an Ed25519 SSH key pair, installed the public key for authentication, verified key-based login, backed up and validated the SSH configuration, and disabled password authentication.

Final effective SSH settings included:

- `PermitRootLogin prohibit-password`
- `PubkeyAuthentication yes`
- `PasswordAuthentication no`

### Phase 7 - System Hardening and Patch Management

Reviewed available package updates before installation and applied Nginx security updates using APT. Performed post-update verification of the Nginx service, configuration, HTTP response, and failed systemd units.

Also reviewed unattended upgrades, privileged sudo membership, UID 0 accounts, authentication failures, and reboot requirements.

### Phase 8 - Backup and Recovery

Verified an existing Nginx website backup, performed a restore test in an isolated directory, and validated backup integrity using SHA-256.

Created a Bash script that generates timestamped Nginx backups and SHA-256 checksum files. Scheduled daily backups using cron and configured backup execution logging.

## Automation Scripts

### System Health Monitoring

`scripts/system-health.sh`

Collects and reports:

- Hostname and date
- System uptime
- Memory usage
- Root filesystem usage
- Disk usage warning when usage reaches the configured threshold
- 1-minute system load average
- Nginx service status
- Failed systemd services

The script is scheduled using cron to generate a daily health report.

### Automated Nginx Backup

`scripts/nginx-backup.sh`

The backup script:

- Creates timestamped `.tar.gz` backups of `/var/www/html`
- Checks the exit status of the backup operation
- Reports backup success or failure
- Generates a SHA-256 checksum for successful backups
- Prevents previous backups from being overwritten by using timestamps

The script is scheduled using cron to run daily.

## Repository Structure

```text
linux-sysadmin-lab/
├── configs/
│   └── nginx-default.conf
│
├── docs/
│   ├── phase1-users-permissions.md
│   ├── phase2-deployment.md
│   ├── phase3-monitoring.md
│   ├── phase4-troubleshooting.md
│   ├── phase5-networking.md
│   ├── phase6-ssh-security.md
│   ├── phase7-hardening-patching.md
│   ├── phase8-backup-recovery.md
│   └── system-health-sample.txt
│
├── scripts/
│   ├── nginx-backup.sh
│   └── system-health.sh
│
├── .gitignore
└── README.md

## Verification and Testing

The project included verification after configuration changes rather than relying only on command execution.

Examples include:

- Verified Nginx service state using `systemctl`.
- Validated Nginx configuration using `nginx -t`.
- Confirmed HTTP availability using `curl`.
- Inspected listening ports using `ss`.
- Tested network connectivity and DNS resolution.
- Verified UFW firewall rules and allowed services.
- Tested SSH password and public-key authentication separately.
- Validated SSH configuration using `sshd -t` before applying changes.
- Verified effective SSH settings using `sshd -T`.
- Confirmed Nginx functionality after package updates.
- Checked for failed systemd units after patching.
- Performed an isolated backup restoration test.
- Verified backup integrity using SHA-256 checksums.

## Lab Environment and Limitations

This project was performed using Ubuntu running under WSL2 on a Windows host.

WSL2 provides a practical Linux environment for learning system administration, but it differs from administering a dedicated or continuously running Linux server. In particular, scheduled tasks and services depend on the WSL environment being active.

The project is intended to demonstrate hands-on Linux administration practice and foundational system administration skills rather than production infrastructure experience.

## What I Learned

Through this project, I gained practical experience working with Linux administration tasks instead of relying only on theoretical knowledge.

I practiced managing users and permissions, administering services with systemd, deploying and troubleshooting Nginx, inspecting Linux logs and networking, configuring firewall rules, securing SSH with public-key authentication, applying and verifying security updates, and implementing backup and recovery procedures.

I also gained experience using Bash scripts and cron to automate recurring administration tasks and learned the importance of validating configurations, checking logs, testing changes, and verifying recovery procedures.

