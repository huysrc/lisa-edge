#!/usr/bin/env bash
set -euo pipefail

echo "[LISA] Checking containers..."

cd "$(dirname "${BASH_SOURCE[0]}")/.."
docker compose --env-file .env -f compose/docker-compose.yml ps

docker ps --format '{{.Names}}' | grep -q lisa-mqtt
docker ps --format '{{.Names}}' | grep -q lisa-ha
docker ps --format '{{.Names}}' | grep -q lisa-uptime

echo "[LISA] Checking MQTT port..."
nc -z localhost 1883

echo "[LISA] Checking Home Assistant port..."
nc -z localhost 8123

echo "[LISA] Edge stack healthy."
