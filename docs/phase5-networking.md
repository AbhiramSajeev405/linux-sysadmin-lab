# Phase 5 - Networking and Firewall


## Network Interfaces

Inspected Linux network interfaces using:

ip addr

Identified:
- lo - loopback interface
- eth0 - main WSL2 network interface
- Verified eth0 was UP and LOWER_UP.

## Routing

Inspected the routing table using:

ip route

Identified the default gateway and learned that the default route is used for traffic destined outside the local network.

## Connectivity Testing

Tested external IP connectivity using:

ping -c 4 8.8.8.8

Result:
- Successful connectivity
- 0% packet loss

Tested hostname connectivity using:

Result:
- Successful hostname resolution and connectivity 
- 0% packet loss

## DNS

Queried DNS using:

nslookup google.com

Inspected DNS resolver configuration using:

cat /etc/resolv.conf

Observed that WSL automatically generates the resolver configuration.

## Ports and Listening Services

Inspected listening TCP/UDP ports and processes using:

sudo ss -tulpn

Filtered Nginx HTTP connection using:

sudo ss -ltnp | grep ':80'

Verified that Nginx was listening on TCP port 80 for IPv4 and IPv6.

Tested TCP connectivity to the Nginx service using:

nc -zv localhost 80

Result:
- Connection to TCP port 80 succeeded.

## UFW Firewall

Checked initial firewall status:

sudo ufw status

Initial result:
- UFW inactive

Inspected available application profiles:

sudo ufw app list

Configured required firewall rules:

sudo ufw allow 'Nginx HTTP'
sudo ufw allow OpenSSH

Verified configured rules before activation:

sudo ufw show added

Enabled the firewall:

sudo ufw enable

Verified firewall configuration:

sudo ufw status verbose

Firewall policy:
- Incoming traffic denied by default
- Outgoing traffic allowed by default
- HTTP (TCP 80) allowed
- OpenSSH (TCP 80) allowed
- UFW logging enabled

## Post-Firewall Verification

Verified the web server after enabling UFW:

curl -I http://localhost

Result:
- HTTP/1.1 200 OK

Verified Nginx was still listening on TCP port *).

Also checked TCP port 8080:

sudo ss -ltnp | grep ':8080'

No output was returned, indicating that no TCP process was listening on port 8080.

## Skills Practiced

- Linux network interface inspection
- IP addressing
- Routing and default gateways
- Network connectivity troubleshooting
- DNS resolution
- TCP ports and listening services
- Port connectivity testing
- UFW firewall configuration
- Default-deny firewall policy
- Firewall rule verification
- Post-change service verification







































