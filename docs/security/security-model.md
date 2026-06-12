# Security Model

LISA Edge should be treated as infrastructure.

## Principles

- VPN-first administration
- No public admin dashboards
- SSH key authentication
- Disable SSH password login
- Minimal exposed ports
- Firewall allowlists
- Secrets outside Git
- Encrypted backups for sensitive data

## Sensitive Services

Protect:

- MQTT
- OTBR dataset backups
- VPN state
- Home Assistant config
- Zigbee2MQTT keys
- NUT control access

## Network Segmentation

Use VLANs or separate subnets when available.

At minimum, separate:

- trusted users
- IoT devices
- cameras
- servers
- management
- guests
