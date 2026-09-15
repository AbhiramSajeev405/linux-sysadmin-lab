# Phase 6 - SSH and Server Security

## SSH Service Inspection

Inspected the SSH service and socket using:

systemctl status ssh --no-pager
systemctl status ssh.socket --no-pager

Observed systemd socket activation for SSH and verified that port 22 was listening.

## SSH Port Verification

Verified the SSH listening port using:

sudo ss -ltnp | grep ':22'

Confirmed TCP port 22 was available for SSH connections.

## SSH Connection Testing

Tested a local SSH connection using:

ssh localhost

Accepted and stored the SSH host fingerprint in the known_hosts file.

Investigated an authentication timeout using:

sudo tail -n 20 /var/log/auth.log

Successfully authenticated to the local SSH server.

## SSH Key Authentication

Generated an Ed25519 SSH key pair:

ssh-keygen -t ed25519 -C "linux-sysadmin-lab"

Private key:
~/.ssh/id_ed25519

Public key:
~/.ssh/id_ed25519.pub

The private key was protected with a passphrase and kept outside the project repository.

Verified restrictive private-key permissions.

Installed the public key for SSH authentication using:

ssh-copy-id -i ~/.ssh/id_ed25519.pub abhiram@localhost

Successfully tested public-key authentication.

## SSH Configuration Hardening

Backed up the SSH server configuration before modification:

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.phase6-backup

Inspected the effective SSH configuration using:

sudo sshd -T

Configured:

PasswordAuthentication no

Validated the configuration before applying it:

sudo sshd -t

Reloaded SSH after successful validation.

## Security Verification

Verified the final effective configuration:

permitrootlogin prohibit-password
pubkeyauthentication yes
passwordauthentication no

Confirmed:
- SSH public-key authentication succeeds.
- Private SSH key is protected with a passphrase.
- Password-only SSH authentication is denied.
- Direct root password authentication is prohibited.
- SSH configuration was backed up before modification.
- Configuration syntax was validated before reload.

## Skills Practiced

- OpenSSH service administration
- systemd socket activation
- SSH port inspection
- SSH host fingerprint verification
- Authentication log troubleshooting
- Ed25519 SSH key generation
- Public/private key authentication
- SSH key permissions
- authorized_keys management
- SSH configuration backup
- SSH configuration validation
- SSH hardening
- Password authentication disabling
- Post-change security verification




































