#!/usr/bin/env bash
set -euo pipefail

# Storage layout
# eMMC (64GB)
# └─ Rescue OS
#    ├─ Ubuntu Server minimal
#    ├─ SSH
#    ├─ Network tools
#    ├─ Recovery scripts
#    └─ Reinstall USB support
#
# SSD (500GB / 1TB)
# └─ Production OS
#    ├─ Ubuntu Server
#    ├─ Docker
#    ├─ All LISA Edge services
#    ├─ Data volumes
#    └─ Backups cache
# .\
# └─ srv/lisa-edge/
#    ├─ backups
#    ├─ data
#    ├─ docker/
#    │  ├─ volumes/
#    │  │  ├─ homeassistant/
#    │  │  ├─ mosquitto/
#    │  │  │  ├─ config/
#    │  │  │  ├─ data/
#    │  │  │  └─ log/
#    │  │  ├─ node-red/
#    │  │  ├─ tailscale/
#    │  │  └─ uptime-kuma/
#    │  └─ config/
#    ├─ logs/
#    └─ state/

DATA_ROOT="${DATA_ROOT:-/srv/lisa-edge}"

mkdir -p "$DATA_ROOT"/{backups,data,logs,state}
mkdir -p "$DATA_ROOT"/docker/{volumes,config}

mkdir -p "$DATA_ROOT"/docker/volumes/{}homeassistant,node-red,tailscale,uptime-kuma}
mkdir -p "$DATA_ROOT"/docker/volumes/mosquitto/{config,data,log}

#install -d -m 0700 "$DATA_ROOT"/secrets
#install -d -m 0700 "$DATA_ROOT"/{ssh,private keys,credentials}
#install -d -m 0755 "$DATA_ROOT"/test

echo "Directories created under $DATA_ROOT"
