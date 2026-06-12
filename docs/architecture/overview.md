# Architecture Overview

LISA Edge is the edge infrastructure layer for LISA AI Brain and smart-home / homelab services.

It is designed to run lightweight, always-on, infrastructure-critical services.

## Role Boundary

```text
LISA Brain
  - ASR
  - LLM
  - TTS
  - Tool orchestration
  - Heavy reasoning

LISA Edge
  - MQTT
  - NUT / UPS
  - NTP
  - DNS helpers
  - OTBR
  - VPN
  - Reverse proxy
  - Monitoring
  - Backup / restore automation
```

LISA Edge should not become the AI server.

## Design Goals

- Local-first operation
- Minimal cloud dependency
- Small resource footprint
- Easy rebuilds
- Portable configuration
- Externalized data volumes
- Backup-first recovery
- Security by default

## Recommended Deployment Model

```text
Network Gateway / Firewall
        │
        ▼
LISA Edge Host
        │
        ├── Core infrastructure services
        ├── Optional smart-home bridge services
        └── Remote access / monitoring
        │
        ▼
LISA Brain / Home Assistant / Homey / Smart Devices
```

The exact hardware is flexible. The important part is the service boundary.
