# LISA Edge
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Part of the **LISA** (Local Intelligent System Assistant) ecosystem.

LISA Edge provides the infrastructure layer that supports the broader LISA
ecosystem while remaining useful as a standalone smart-home or homelab platform.

The project focuses on reliability, local-first operation, security, backup, and disaster recovery rather than AI workloads.

For an overview of the broader **LISA** project, see:

[About LISA](docs/architecture/about-lisa.md)

---

# What is LISA Edge?

LISA Edge is a lightweight Linux infrastructure stack that provides local-first services required by:

* LISA AI Brain
* Matter deployments
* Thread networks
* Smart homes
* Homelabs

LISA Edge focuses on infrastructure rather than AI workloads.

It may be used:

* together with LISA AI Brain
* as a standalone smart-home platform
* as a homelab edge services node

---

# Goals

LISA Edge exists to provide:

* Thread Border Router (OTBR)
* MQTT messaging
* NUT (UPS integration)
* DNS and service helpers
* Reverse proxy
* VPN endpoints
* Monitoring and health checks
* Backup and recovery automation

LISA Edge is intentionally lightweight.

Heavy workloads belong on dedicated systems.

Examples:

* LLM inference
* Speech processing
* Computer vision
* Large databases
* NAS workloads
* Video analytics

---

# Architecture

```text
Internet
    │
    ▼
Network Infrastructure
    │
    ▼
LISA Edge
    │
    ├── OTBR
    ├── MQTT
    ├── NUT
    ├── VPN
    ├── DNS Helpers
    ├── Monitoring
    └── Backup Services
    │
    ▼
Matter / Thread / IoT Devices
```

LISA Edge is infrastructure.

LISA Edge is not the AI server.

For architecture guidance see:

* docs/architecture/ARCHITECTURE.md
* docs/architecture/reference-deployment.md
* docs/architecture/service-boundaries.md

---

# Supported Platforms

LISA Edge is hardware agnostic.

Any Linux system capable of running Docker may be used.

Examples:

* ZimaBoard 2
* Raspberry Pi 4
* Raspberry Pi 5
* Intel NUC
* Mini PC
* Generic x86-64 server
* Ubuntu VM
* Debian VM

---

# Reference Platform

The recommended reference platform is:

* ZimaBoard 2

Reasons:

* Low power consumption
* SATA support
* PCIe expansion
* Reliable Docker performance
* Compact deployment footprint

LISA Edge does not require ZimaBoard.

All documentation and testing are primarily validated against this platform.

---

# Core Services

| Service       | Purpose                  |
| ------------- | ------------------------ |
| OTBR          | Thread Border Router     |
| MQTT          | Event messaging          |
| NUT           | UPS monitoring           |
| Reverse Proxy | Internal service routing |
| Tailscale     | Secure remote access     |
| Uptime Kuma   | Service monitoring       |
| DNS Helpers   | Local service discovery  |
| NTP           | Time synchronization     |

See:

* docs/services/

---

# Thread and Matter

LISA Edge supports Matter-over-Thread deployments through OpenThread Border Router (OTBR).

Important:

The Thread Dataset is critical infrastructure.

Loss of the dataset may require re-pairing Matter-over-Thread devices.

LISA Edge includes support for:

* Dataset backup
* Dataset restore
* Migration workflows
* Disaster recovery procedures

Documentation:

* [docs/services/thread.md](docs/services/thread.md)
* [docs/services/matter.md](docs/services/matter.md)
* [docs/services/otbr.md](docs/services/otbr.md)
* [docs/operations/service-recovery/otbr.md](docs/operations/service-recovery/otbr.md)

---

# Getting Started

Before deployment:

* Review deployment requirements
* Select required services
* Configure networking
* Configure backups

Documentation:

* [docs/getting-started/deployment-checklist.md](docs/getting-started/deployment-checklist.md)
* [docs/getting-started/service-selection.md](docs/getting-started/service-selection.md)
* [docs/getting-started/autoinstall-flow.md](docs/getting-started/autoinstall-flow.md)

Clone repository:

```bash
git clone https://github.com/lisahq/lisa-edge.git
cd lisa-edge
```

Configure environment:

```bash
cp .env.example .env
```

Deploy:

```bash
./scripts/deploy.sh
```

---

# Security Principles

LISA Edge follows a security-first approach.

Recommendations:

* SSH key authentication
* VPN-first administration
* Minimal exposed ports
* VLAN segmentation
* Secrets outside Git
* Regular backups
* Recovery testing

See:

* docs/security/

---

# Backup and Recovery

Critical services should be recoverable from backup.

LISA Edge emphasizes:

* Infrastructure as code
* Docker Compose
* Portable volumes
* Automated backups
* Minimal manual intervention

Documentation:

* docs/operations/

---

# Documentation Structure

```text
docs/
│
├── architecture/
├── getting-started/
├── services/
├── operations/
├── security/
├── hardware/
└── README.md
```

---

# Design Philosophy

LISA Edge is:

* Linux-first
* Docker-first
* Local-first
* Hardware agnostic
* Recovery focused

LISA Edge is infrastructure.

It is not intended to become an all-in-one server.

---

# License

Licensed under the **Apache 2.0** License.
See [LICENSE](LICENSE) for details.

This repository provides the infrastructure layer of the LISA ecosystem.

The license applies only to this repository and does not grant rights to proprietary LISA components, models, datasets, or private services.

Copyright (c) 2026 **[LisaHQ](https://lisahq.io)**
