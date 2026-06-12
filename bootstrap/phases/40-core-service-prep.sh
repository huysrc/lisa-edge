#!/usr/bin/env bash
set -euo pipefail


###############################################################################
# Time sync
###############################################################################
echo "Installing Chrony time sync..."

apt-get install -y chrony

systemctl enable chrony
systemctl restart chrony

chronyc tracking || true

echo "Chrony configured."


###############################################################################
# MQTT defaults
###############################################################################
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


###############################################################################
# Thread / OTBR host preparation
###############################################################################
# Thread/OTBR host preparation is optional.
# It is only needed when this host runs OpenThread Border Router.

if ! echo "${LISA_COMPOSE_SERVICES:-}" | grep -qw otbr && [ "${LISA_ENABLE_THREAD_HOST_PREP:-0}" != "1" ]; then
  echo "Skipping Thread host preparation. Enable with LISA_COMPOSE_SERVICES=otbr or LISA_ENABLE_THREAD_HOST_PREP=1."
  exit 0
fi

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
