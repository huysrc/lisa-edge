# LISA Edge

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Part of the **LISA** ecosystem.

**LISA** stands for **Local Intelligent System Assistant**.

LISA is a local-first AI ecosystem designed to become a true digital caretaker for intelligent environments. Its long-term goal is to understand context, coordinate smart-home devices, support natural interaction, and continue operating even when cloud services are unavailable.

**LISA Edge** is the infrastructure layer of that ecosystem.

It provides the local connectivity, messaging, networking, monitoring, backup, and operational services that allow the broader LISA platform to run reliably.

LISA Edge is **not** the AI brain.  
LISA Edge is the foundation that keeps the environment connected, recoverable, and locally available.

For a broader overview, see:

- [About LISA](docs/architecture/about-lisa.md)
- [Ecosystem Overview](docs/architecture/ecosystem-overview.md)

---

## Why LISA Edge Exists

AI systems should not depend entirely on cloud connectivity, fragile integrations, or a single overloaded host running every service.

LISA Edge exists to provide a resilient, secure, local-first infrastructure foundation for the LISA ecosystem.

It focuses on:

- local availability
- infrastructure services
- secure connectivity
- service discovery
- edge automation support
- network integration
- backup and recovery
- operational resilience

If cloud services become unavailable, LISA Edge should continue supporting critical local infrastructure.

---

## What LISA Edge Provides

LISA Edge is a lightweight Linux infrastructure stack for:

- Thread Border Router services
- Matter-over-Thread support
- MQTT messaging
- DNS and local service discovery
- NTP / local time synchronization
- reverse proxy and certificate management
- VPN-first remote administration
- health monitoring
- backup jobs
- restore procedures
- infrastructure automation

---

## What LISA Edge Is Not

LISA Edge should not become an all-in-one server.

Avoid placing heavy workloads here unless explicitly justified.

LISA Edge is generally **not**:

- LISA Brain
- an LLM inference server
- a speech processing server
- a memory or agent reasoning system
- a primary NAS
- a video analytics server
- a large database host
- a heavy camera processing node

Those workloads belong on dedicated LISA Brain, NAS, Vision, or compute systems.

See:

- [Service Boundaries](docs/architecture/service-boundaries.md)

---

## LISA Ecosystem

```text
LISA Ecosystem

                   Internet
                      │
                      ▼
        ┌───────────────────────────┐
        │ Network Infrastructure    │
        │ UniFi / VLANs / Firewall  │
        └───────────────────────────┘
                      │
                      ▼
        ┌───────────────────────────┐
        │ LISA Edge                 │
        │ OTBR / MQTT / NUT / VPN   │
        │ DNS / NTP / Monitoring    │
        │ Backup / Restore          │
        └───────────────────────────┘
                      │
                      ▼
        ┌───────────────────────────┐
        │ LISA Brain                │
        │ AI Reasoning / Voice      │
        │ Memory / Agents / Tools   │
        └───────────────────────────┘
                      │
                      ▼
        ┌───────────────────────────┐
        │ Smart Home Environment    │
        │ Matter / Thread / IoT     │
        │ Homey / Home Assistant    │
        └───────────────────────────┘
```

LISA Edge supports intelligence.  
It does not replace it.

---

## Supported Platforms

LISA Edge is hardware-independent.

Any Linux system capable of running Docker may be used.

Examples:

- ZimaBoard 2
- Raspberry Pi 4 / 5
- Intel NUC
- Mini PC
- generic x86-64 server
- NAS Docker host
- virtual machine
- cloud VM

Hardware is a deployment detail, not an architectural requirement.

---

## Reference Platform

The current reference deployment target is:

- ZimaBoard 2 1664
- 16 GB RAM
- 64 GB eMMC
- UPS available
- Samsung SATA SSD
- Mellanox MCX312A-XCBT
- future 10GbE networking

Recommended storage model:

| Storage                | Purpose                                                                     |
|------------------------|-----------------------------------------------------------------------------|
| eMMC                   | Rescue OS, recovery environment, emergency maintenance                      |
| SATA SSD               | Primary Ubuntu Server installation, Docker volumes, persistent service data |
| NAS / External Storage | Backups, archives, restore images                                           |

### Design Rule

LISA Edge should boot from SSD.  
Avoid heavy writes to eMMC.

The onboard eMMC should be preserved as an independent rescue and recovery environment whenever practical..  
This provides an additional recovery path if the primary SSD installation becomes unavailable.

See:

- [Reference Deployment](docs/architecture/reference-deployment.md)

---

## LISA Edge Services

| Service        | Purpose                                     |
|----------------|---------------------------------------------|
| MQTT           | Local event messaging                       |
| Uptime Kuma    | Lightweight monitoring                      |
| Backup helper  | Backup and restore workflow support         |
| OTBR           | Thread Border Router                        |
| NUT            | UPS monitoring and graceful shutdown        |
| VPN            | Secure remote administration                |
| DNS helpers    | Local name resolution and service discovery |
| NTP / Chrony   | Reliable local time sync                    |
| Reverse Proxy  | Internal service routing                    |

See:

- [Service Catalog](docs/services/README.md)

---

## Thread and Matter

LISA Edge supports Matter-over-Thread deployments through OpenThread Border Router.

The Thread Dataset is critical infrastructure.

Losing the dataset may require re-pairing Matter-over-Thread devices.

LISA Edge documentation includes:

- dataset backup
- dataset restore
- migration workflows
- disaster recovery procedures

See:

- [Thread](docs/services/thread.md)
- [Matter](docs/services/matter.md)
- [OTBR](docs/services/otbr.md)
- [OTBR Recovery](docs/operations/service-recovery/otbr.md)

---

## Getting Started

Start here:

- [Documentation Index](docs/README.md)
- [Quick Start](docs/getting-started/quick-start.md)
- [Deployment Checklist](docs/getting-started/deployment-checklist.md)
- [Deployment Validation](docs/getting-started/deployment-validation.md)
- [USB Autoinstall Flow](docs/getting-started/autoinstall-flow.md)

Basic flow:

```bash
git clone https://github.com/LisaHQ/lisa-edge.git
cd lisa-edge
cp .env.example .env
sudo ./bootstrap/bootstrap.sh
sudo ./scripts/deploy.sh
sudo ./scripts/healthcheck.sh
```

---

## Security Principles

LISA Edge follows a security-first approach.

Recommended defaults:

- VPN-first administration
- SSH key authentication
- no public admin dashboards
- minimal exposed ports
- VLAN segmentation
- firewall allow-lists
- least privilege
- secrets outside Git
- regular backups
- restore testing

High-sensitivity networks such as alarm, access-control, camera, and management VLANs should receive additional protection.

See:

- [Security Model](docs/security/security-model.md)
- [Network Model](docs/security/network-model.md)
- [UniFi Firewall Notes](docs/security/unifi-firewall.md)

---

## Backup and Recovery

LISA Edge prioritizes recovery over unnecessary clustering.

Priority order:

1. backup
2. restore
3. reliability
4. failover

Critical services should provide:

- backup procedure
- restore procedure
- health checks
- restart policies
- exportable configuration

A failed LISA Edge host should be replaceable from source-controlled configuration and backups.

See:

- [Backup and Restore](docs/operations/backup-restore.md)
- [Disaster Recovery](docs/operations/disaster-recovery.md)

---

## Roadmap

See:

- [Roadmap](docs/roadmap.md)

---

## Design Philosophy

LISA Edge is:

- Linux-first
- Docker-first
- local-first
- security-conscious
- hardware-independent
- recovery-focused
- practical immutable infrastructure

Infrastructure exists to support intelligence, not replace it.

---

## License

Licensed under the **Apache 2.0** License.

See [LICENSE](LICENSE) for details.

This repository provides the infrastructure layer of the LISA ecosystem.

The license applies only to this repository and does not grant rights to proprietary LISA components, models, datasets, or private services.

Copyright (c) 2026 **[LisaHQ](https://lisahq.io)**
