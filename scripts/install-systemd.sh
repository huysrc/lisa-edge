#!/usr/bin/env bash
set -euo pipefail

EDGE_REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ "$(id -u)" -ne 0 ]; then
  echo "Run as root: sudo $0" >&2
  exit 1
fi

install -m 0644 "$EDGE_REPO/systemd/lisa-edge.service" /etc/systemd/system/lisa-edge.service
install -m 0644 "$EDGE_REPO/systemd/lisa-edge-backup.service" /etc/systemd/system/lisa-edge-backup.service
install -m 0644 "$EDGE_REPO/systemd/lisa-edge-backup.timer" /etc/systemd/system/lisa-edge-backup.timer

if [ -f "$EDGE_REPO/systemd/lisa-otbr-dataset-backup.service" ]; then
  install -m 0644 "$EDGE_REPO/systemd/lisa-otbr-dataset-backup.service" /etc/systemd/system/lisa-otbr-dataset-backup.service
fi
if [ -f "$EDGE_REPO/systemd/lisa-otbr-dataset-backup.timer" ]; then
  install -m 0644 "$EDGE_REPO/systemd/lisa-otbr-dataset-backup.timer" /etc/systemd/system/lisa-otbr-dataset-backup.timer
fi

systemctl daemon-reload
systemctl enable lisa-edge.service
systemctl enable lisa-edge-backup.timer
systemctl start lisa-edge-backup.timer

# The OTBR dataset timer is harmless when OTBR is enabled, but should not be
# forced on every LISA Edge installation.
if [ -f /etc/systemd/system/lisa-otbr-dataset-backup.timer ]; then
  echo "OTBR dataset backup timer installed. Enable it when OTBR is used:"
  echo "  sudo systemctl enable --now lisa-otbr-dataset-backup.timer"
fi

echo "Installed and enabled lisa-edge runtime and backup services."
