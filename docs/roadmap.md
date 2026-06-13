# LISA Edge Roadmap

This roadmap describes the expected evolution of LISA Edge.

It is intentionally focused on infrastructure, not AI workloads.

---

## Phase 1: Edge Foundation

Goal:

Build a reproducible, secure, local-first infrastructure base.

Focus areas:

- Linux host bootstrap
- Docker and Docker Compose
- Git-managed configuration
- SSD-backed persistent volumes
- baseline firewall rules
- SSH key authentication
- health checks
- backup and restore procedures

Expected outcome:

A LISA Edge node can be rebuilt from documented configuration and backups.

---

## Phase 2: Core Infrastructure Services

Goal:

Run lightweight services that support local availability and smart-home infrastructure.

Services:

- MQTT
- OTBR
- NUT
- NTP / Chrony
- DNS helpers
- reverse proxy
- VPN
- Uptime Kuma
- backup helpers

Expected outcome:

The local environment remains operational even when cloud services are unavailable.

---

## Phase 3: Matter and Thread Reliability

Goal:

Make Thread and Matter deployments recoverable.

Focus areas:

- Thread Dataset backup
- Thread Dataset restore
- OTBR migration workflows
- Matter-over-Thread recovery documentation
- adapter replacement procedures
- service health checks

Expected outcome:

Matter-over-Thread infrastructure can survive host replacement or OTBR redeployment.

---

## Phase 4: Network Integration

Goal:

Integrate LISA Edge cleanly with the local network.

Focus areas:

- VLAN-aware deployment guidance
- firewall allow-lists
- mDNS / service discovery behavior
- UniFi integration notes
- VPN-first administration
- sensitive network isolation

Expected outcome:

LISA Edge supports the smart-home network without weakening security boundaries.

---

## Phase 5: Operations and Recovery

Goal:

Improve operational resilience.

Focus areas:

- scheduled backups
- restore drills
- service-level recovery guides
- monitoring dashboards
- alerting
- documented maintenance workflows
- UPS shutdown validation

Expected outcome:

The node can fail, be replaced, and return to service without relying on memory or manual guesswork.

---

## Phase 6: Multi-Site and Advanced Connectivity

Goal:

Prepare LISA Edge for future distributed deployments.

Potential services:

- WireGuard
- Headscale
- Netmaker
- NetBird
- site-to-site routing
- remote service discovery
- multi-location backup policy

Expected outcome:

LISA Edge can support remote administration and future multi-site LISA deployments.

---

## Explicit Non-Roadmap Items

The following are intentionally outside the primary LISA Edge roadmap:

- LLM inference
- ASR / TTS processing
- agent reasoning
- long-term memory systems
- computer vision analytics
- Frigate camera processing
- NAS workloads
- large databases
- heavy media storage

These belong to other layers of the LISA ecosystem.
