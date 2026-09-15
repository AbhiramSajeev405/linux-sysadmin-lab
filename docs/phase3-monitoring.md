# Phase 3 - System Monitoring and Automation

## Objective

Practice Linux system monitoring, process management, service monitoring, basic bash scripting, and scheduled health checks.

## System Resource Monitoring

Commands used:
- uptime 
- free -h
- df -h
- du -sh
- top
- htop
- vmstat
- iostat

Monitored:
- CPU usage
- Memory and swap usage
- Disk usage
- System load
- System uptime

## Process Management

Practiced:
- ps
- pgrep
- jobs
- kill
- SIGTERM (15)
- SIGKILL (9)

Tested process termination using temporary sleep and CPU-load processes.

## Service Monitoring

Monitored the Nginx service using:
- systemctl status
- systemctl is-active
- systemctl --failed
- systemctl show


Checked the Nginx main PID, memory usage, worker processes, and service health.


## Bash Health Monitoring Script

Created:

scripts/system-health.sh
- Hostname
- Date and uptime
- Memory and swap usage
- Nginx service status
- Root filesystem usage
- Disk usage warning at 80%
- 1-minute load average
- Failed systemd services

Tested both healthy and failure conditions for the Nginx service and disk warning logic.

## Cron Automation

Configured cron to run the system health script automatically.

Schedule:

0 9 * * *

The health report is written to:

docs/daily-health-report.txt

Cron execution was tested using a temporary scheduled job and verified through /var/log/syslog.

## Skills Practiced
- Linux resource monitoring
- Process monitoring and management
- Process signals
- Service health monitoring
- Bash variables
- Command substitution
- Pipes and output redirection
- if/else conditions
- Exit-status based checks
- Disk threshold monitoring
- Cron scheduling
- Basic troubleshooting


























