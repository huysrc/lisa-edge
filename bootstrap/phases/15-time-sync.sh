#!/usr/bin/env bash
set -euo pipefail

echo "Installing Chrony time sync..."

apt-get install -y chrony

systemctl enable chrony
systemctl restart chrony

chronyc tracking || true

echo "Chrony configured."
