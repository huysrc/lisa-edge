# Reverse Proxy

A reverse proxy can provide clean internal URLs and HTTPS for dashboards.

## Purpose

Examples:

- Uptime Kuma
- Node-RED
- Home Assistant
- internal LISA APIs

## Security Rule

Do not publish admin dashboards directly to the internet.

Prefer access through VPN and firewall allowlists.

## Status

Reverse proxy deployment is planned. Candidate options include Caddy, Traefik, and Nginx Proxy Manager.
