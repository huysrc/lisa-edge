#!/usr/bin/env bash
set -euo pipefail

DATA_ROOT="${DATA_ROOT:-/srv/lisa-edge}"

mkdir -p "$DATA_ROOT"/{data,backups,logs}
mkdir -p "$DATA_ROOT"/docker/{volumes,config}

mkdir -p "$DATA_ROOT"/docker/volumes/mosquitto/{config,data,log}
mkdir -p "$DATA_ROOT"/docker/volumes/uptime-kuma

#install -d -m 0700 "$DATA_ROOT"/secrets
#install -d -m 0700 "$DATA_ROOT"/{ssh,private keys,credentials}
#install -d -m 0755 "$DATA_ROOT"/test

echo "Directories created under $DATA_ROOT"
