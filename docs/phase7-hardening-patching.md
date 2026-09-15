# Phase 7 - System Hardening and Patch Management

## Package Update Inspection

Refreshed the local package repository information using:

sudo apt update

The system reported that 8 packages were available for upgrade.

Reviewed the available packages before installing updates:

apt list --upgradable

This demonstrated the practice of inspecting pending updates before applying changes to a system.

## Security Patch Installation

Ran:

sudo apt upgrade

APT selected the Nginx packages for upgrade:

- nginx
- nginx-common

Six additional packages were temporarily not upgraded because of Ubuntu's phased update rollout.

The Nginx package revision was upgraded from:

1.28.3-2ubuntu1.10

to:

1.28.3-2ubuntu1.11

No packages were removed during the upgrade.

## Post-Update Verification

After applying the Nginx update, verified the service using:

systemctl status nginx --no-pager

Validated the Nginx configuration:

sudo nginx -t

Verified that the web server continued responding:

curl -I http://localhost

Result:

HTTP/1.1 200 OK

Checked for failed systemd units:

systemctl --failed

No failed units were detected.

Verified the installed Nginx package version using:

apt list --installed nginx nginx-common

This confirmed that the updated package revision was installed successfully.

## Automatic Security Updates

Verified that the unattended-upgrades package was installed:

dpkg -l | grep unattended-upgrades

Inspected the automatic update configuration:

cat /etc/apt/apt.conf.d/20auto-upgrades

The system was configured with:

APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";

This confirmed that automatic package-list updates and unattended upgrades were enabled.

## Automatic Upgrade Timer

Inspected the systemd timer responsible for scheduled APT upgrade activities:

systemctl status apt-daily-upgrade.timer --no-pager

The timer was:

active (waiting)

A future trigger time was configured for apt-daily-upgrade.service.

## Privileged Account Review

Inspected membership of the sudo group:

getent group sudo

Result:

abhiram was the only explicitly listed member of the sudo group.

Checked for accounts with UID 0:

awk -F: '$3 == 0 {print $1, $3}' /etc/passwd

Result:

root 0

No additional UID 0 accounts were identified.

## Authentication Failure Review

Reviewed recent authentication failures using:

sudo grep -i "authentication failure" /var/log/auth.log | tail -n 10

Observed a previous sudo authentication failure associated with the lab user account.

This demonstrated the use of authentication logs when reviewing failed authentication activity.

## Reboot Requirement Check

Checked whether installed updates required a system reboot:

test -f /var/run/reboot-required && cat /var/run/reboot-required || echo "No reboot required"

Result:

No reboot required

## Patch Management Workflow Practiced

The following workflow was used:

1. Refresh package information
2. Review available updates
3. Review packages selected for upgrade
4. Apply approved security updates
5. Verify affected services
6. Validate service configuration
7. Test application availability
8. Check for failed systemd units
9. Verify the installed package version
10. Check whether a reboot is required

## Skills Practiced

- Linux package management with APT
- Package update inspection
- Security patch installation
- Ubuntu phased updates
- Post-patch service verification
- Nginx configuration validation
- Installed package version verification
- Automatic security updates
- systemd timer inspection
- Privileged account auditing
- UID 0 account auditing
- Authentication log review
- Reboot requirement checking
- Basic Linux system hardening
