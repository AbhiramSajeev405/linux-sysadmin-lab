#!/bin/bash

echo "====================================="
echo "	    Linux System Health Report"
echo "====================================="
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo ""
echo "--- Memory Usage ---"
free -h
echo ""
echo "--- Nginx Service ---"

if systemctl is-active --quiet nginx; then
	echo "Nginx Status: RUNNING"
else
	echo "Nginx Status: NOT RUNNING"
fi
echo ""
echo "---Disk Usage ---"

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root filesystem usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -ge 80 ]; then
	echo "Disk Status: WARNING - Disk usage is high!"
else
	echo "Disk Status: OK"
fi
echo ""
echo "--- System Load ---"

LOAD=$(awk '{print $1}' /proc/loadavg)

echo "1-minute load average: $LOAD"
echo ""
echo "--- Failed Services ---"

FAILED_UNITS=$(systemctl --failed --no-legend | grep -c 'failed')

if [ "$FAILED_UNITS" -eq 0 ]; then
	echo "Failed Services: NONE"
else
	echo "Failed Services: $FAILED_UNITS"
fi
