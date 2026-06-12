#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EDGE_REPO="$(cd "$SCRIPT_DIR/../.." && pwd)"
DATA_ROOT="${DATA_ROOT:-/srv/lisa-edge}"
MOSQUITTO_CONFIG_DIR="$DATA_ROOT/docker/volumes/mosquitto/config"
MOSQUITTO_CONFIG="$MOSQUITTO_CONFIG_DIR/mosquitto.conf"
MOSQUITTO_PASSWORDS="$MOSQUITTO_CONFIG_DIR/passwords"
MQTT_USERNAME="${MQTT_USERNAME:-lisa}"
MQTT_PASSWORD="${MQTT_PASSWORD:-change-this-password}"

mkdir -p "$MOSQUITTO_CONFIG_DIR"

if [ ! -f "$EDGE_REPO/config/mqtt/mosquitto.conf" ]; then
  echo "Missing source config: $EDGE_REPO/config/mqtt/mosquitto.conf" >&2
  exit 1
fi

if [ ! -f "$MOSQUITTO_CONFIG" ]; then
  cp "$EDGE_REPO/config/mqtt/mosquitto.conf" "$MOSQUITTO_CONFIG"
fi

if [ ! -f "$MOSQUITTO_PASSWORDS" ]; then
  if [ "$MQTT_PASSWORD" = "change-this-password" ] || [ "$MQTT_PASSWORD" = "changeme" ]; then
    echo "WARNING: MQTT_PASSWORD is still a default value. Change it in .env before production use." >&2
  fi
  docker run --rm -v "$MOSQUITTO_CONFIG_DIR:/mosquitto/config" eclipse-mosquitto:2 \
    mosquitto_passwd -b -c /mosquitto/config/passwords "$MQTT_USERNAME" "$MQTT_PASSWORD"
fi

chmod 0640 "$MOSQUITTO_CONFIG" "$MOSQUITTO_PASSWORDS" || true

echo "Mosquitto config and password file ready."
