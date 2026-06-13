# LISA Ecosystem Overview

LISA stands for **Local Intelligent System Assistant**.

LISA is a local-first AI ecosystem designed to become a digital caretaker for intelligent environments.

The purpose of this document is to explain where **LISA Edge** fits within the broader LISA architecture.

---

## Ecosystem Layers

```text
LISA Ecosystem

├── Network Infrastructure
│   ├── routing
│   ├── firewall policy
│   ├── VLANs
│   ├── Wi-Fi
│   └── physical connectivity
│
├── LISA Edge
│   ├── OTBR
│   ├── MQTT
│   ├── NUT
│   ├── DNS helpers
│   ├── NTP
│   ├── VPN
│   ├── reverse proxy
│   ├── monitoring
│   ├── backup / restore helpers
│   └── ...
│
├── LISA Brain
│   ├── AI reasoning
│   ├── voice interaction
│   ├── memory
│   ├── automation orchestration
│   ├── tool execution
│   └── decision making
│
├── Smart Home Layer
│   ├── Matter
│   ├── Thread
│   ├── Wi-Fi devices
│   ├── Zigbee
│   ├── Homey
│   ├── Home Assistant
│   └── ...
│
└── Future Compute / Vision
    ├── camera analytics
    ├── object detection
    ├── AI compute nodes
    ├── multi-site services
    └── ...
```

---

## LISA Edge Role

LISA Edge provides the reliable local infrastructure required by the rest of the ecosystem.

Its job is to keep the environment connected, reachable, observable, and recoverable.

LISA Edge should continue operating even if cloud services are unavailable.

---

## LISA Brain Role

LISA Brain provides intelligence.

It may include:

- LLM inference
- voice processing
- agent workflows
- long-term memory
- planning
- reasoning
- smart-home orchestration

These workloads should generally remain separate from LISA Edge.

---

## Smart Home Role

The smart-home layer contains device ecosystems and controllers.

Examples:

- Matter devices
- Thread devices
- Wi-Fi IoT devices
- Zigbee devices
- Homey
- Home Assistant

Depending on deployment size, some lightweight bridge services may temporarily run on LISA Edge, but the architectural boundary should remain clear.

---

## Design Rule

When deciding where a service belongs, ask:

- Is it infrastructure?
- Is it lightweight?
- Does it improve local availability?
- Does it improve reliability or recoverability?
- Can it be backed up and restored cleanly?
- Does it preserve security boundaries?

If yes, it may belong on LISA Edge.

If it performs heavy reasoning, storage, video analytics, or complex automation, it likely belongs elsewhere.
