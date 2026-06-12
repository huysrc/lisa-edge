# Monitoring

LISA Edge currently includes Uptime Kuma as a lightweight monitoring service.

## Purpose

Monitor:

- MQTT
- OTBR
- VPN
- DNS/NTP helpers
- LISA Brain endpoints
- local dashboards

## Recommendation

Keep monitoring lightweight on the edge host.

Avoid large high-write observability stacks unless data is stored on external storage or a dedicated monitoring server.
