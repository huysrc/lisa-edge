#!/usr/bin/env bash
set -euo pipefail

echo "Installing backup tools..."

apt-get install -y rsync restic

DATA_ROOT="${DATA_ROOT:-/svr/lisa-edge}"
mkdir -p "$DATA_ROOT"/backups

echo "Backup tools installed."
