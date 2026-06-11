#!/usr/bin/env bash
set -euo pipefail

EDGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$EDGE_DIR/.env"

BACKUP_DIR="${BACKUP_DEST:-$DATA_ROOT/backups}"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
ARCHIVE="$BACKUP_DIR/lisa-edge-backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[LISA] Creating backup: $ARCHIVE"

docker compose -f /opt/lisa/compose/docker-compose.yml stop

tar --exclude='*/log/*' -czf "$ARCHIVE" \
  $DATA_ROOT/data \
  $DATA_ROOT/docker \
  $DATA_ROOT/states \
  --exclude=$DATA_ROOT/data/tailscale

docker compose -f $EDGE_DIR/compose/docker-compose.yml up -d

echo "[LISA] Backup completed: $ARCHIVE"
