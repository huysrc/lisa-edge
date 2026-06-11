#!/usr/bin/env bash
set -euo pipefail

DATA_ROOT="${DATA_ROOT:-/srv/lisa-edge}"
MOSQUITTO_CONFIG="$DATA_ROOT/docker/volumes/mosquitto/config/mosquitto.conf"

mkdir -p "$(dirname "$MOSQUITTO_CONFIG")"

if [ ! -f "$MOSQUITTO_CONFIG" ]; then
  cat > "$MOSQUITTO_CONFIG" <<'EOF'
persistence true
persistence_location /mosquitto/data/

log_dest file /mosquitto/log/mosquitto.log
log_dest stdout
log_type error
log_type warning
log_type notice
log_type information

listener 1883
allow_anonymous true

listener 9001
protocol websockets
allow_anonymous true
EOF
fi

echo "Mosquitto default config ready."
