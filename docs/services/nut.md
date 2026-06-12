# NUT / UPS

NUT provides UPS monitoring and graceful shutdown support.

## Purpose

Use NUT to protect:

- LISA Edge
- LISA Brain
- NAS
- network switches
- other infrastructure nodes

## Recommended Model

One NUT server can monitor the UPS and other machines can run as NUT clients.

LISA Edge can be either:

- NUT server, if the UPS USB connection is attached to it
- NUT client, if another host owns the UPS USB connection

## Status

NUT documentation is planned. Add deployment once the UPS topology is finalized.
