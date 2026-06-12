# Service Catalog

LISA Edge is a collection of lightweight infrastructure services.

No single service should dominate the project. OTBR is important for Matter-over-Thread, but it is only one part of the stack.

## Core Services

| Service | Role |
|---|---|
| MQTT | Event and messaging backbone |
| Uptime Kuma | Health monitoring |
| Backup helper | Backup workflow support |

## Optional Services

| Service | Role |
|---|---|
| OTBR | Thread Border Router |
| Tailscale | VPN and remote access |
| Home Assistant | Smart-home controller |
| Zigbee2MQTT | Zigbee bridge |
| Node-RED | Lightweight automation flows |

## Planned / External Services

| Service | Role |
|---|---|
| NUT | UPS monitoring and graceful shutdown |
| NTP / Chrony | Local time sync |
| DNS helpers | Local resolution and service discovery |
| Reverse proxy | Internal HTTPS and routing |

## Service Placement Rule

Run lightweight infrastructure services on LISA Edge.

Move heavy compute, large databases, and long-term storage to dedicated systems.
