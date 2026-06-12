# NTP / Chrony

Reliable time sync is important for logs, certificates, VPN, authentication, and distributed services.

LISA Edge installs Chrony during bootstrap.

## Purpose

Chrony can be used as:

- a local time client
- a LAN time helper
- an infrastructure dependency for other services

## Recommendation

Keep time sync simple. Use upstream NTP sources and optionally allow trusted internal networks to query the edge host.
