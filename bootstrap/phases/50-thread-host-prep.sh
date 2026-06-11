#!/usr/bin/env bash
set -euo pipefail

echo "Preparing host for Thread Border Router..."

apt-get install -y avahi-daemon

# OTBR needs IPv6 and forwarding enabled. These settings are safe even when OTBR profile is disabled.
cat >/etc/sysctl.d/lisa-thread.conf <<'EOF'
net.ipv6.conf.all.disable_ipv6 = 0
net.ipv6.conf.all.forwarding = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system

systemctl enable avahi-daemon
systemctl restart avahi-daemon

echo "Thread host preparation completed."
