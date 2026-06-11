#!/usr/bin/env bash
set -euo pipefail

echo "Applying basic host hardening..."

# Disable SSH password login if key login is already configured
SSHD_CONFIG="/etc/ssh/sshd_config"

if [ -f "$SSHD_CONFIG" ]; then
  sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication no/' "$SSHD_CONFIG"
  sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' "$SSHD_CONFIG"
  systemctl reload ssh || systemctl reload sshd || true
fi

echo "Host hardening completed."
