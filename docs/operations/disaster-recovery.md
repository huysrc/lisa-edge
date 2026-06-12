# Disaster Recovery

The goal is to replace the edge host without rebuilding everything manually.

## Recovery Flow

```text
Install Linux
  ↓
Clone lisa-edge
  ↓
Restore .env and backups
  ↓
Run bootstrap/deploy
  ↓
Verify services
```

## Critical State

| Service | Critical state |
|---|---|
| MQTT | config, password file, retained data |
| OTBR | Thread dataset |
| Tailscale | state directory or re-auth key |
| Uptime Kuma | monitor database |
| Home Assistant | config directory |
| Zigbee2MQTT | config and coordinator backup |

## Test Restores

A backup is not trustworthy until a restore has been tested.
