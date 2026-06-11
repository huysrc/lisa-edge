#!/usr/bin/env bash
set -euo pipefail

echo "Installing backup tools..."

apt-get install -y rsync restic

mkdir -p /srv/lisa-edge/backups

echo "Backup tools installed."
