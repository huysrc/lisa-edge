#!/usr/bin/env bash
set -euo pipefail

EDGE_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ "$(id -u)" -ne 0 ]; then
  echo "Run as root: sudo $0" >&2
  exit 1
fi

install -m 0644 "$EDGE_REPO/systemd/lisa-edge.service" /etc/systemd/system/lisa-edge.service
install -m 0644 "$EDGE_REPO/systemd/backup-lisa-edge.service" /etc/systemd/system/backup-lisa-edge.service
install -m 0644 "$EDGE_REPO/systemd/backup-lisa-edge.timer" /etc/systemd/system/backup-lisa-edge.timer

systemctl daemon-reload
systemctl enable lisa-edge.service
systemctl enable backup-lisa-edge.timer
systemctl start backup-lisa-edge.timer

echo "Installed and enabled lisa-edge.service and backup-lisa-edge.timer."
