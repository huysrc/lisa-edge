# Tailscale / VPN

Tailscale provides simple remote access to LISA Edge and related internal services.

## Purpose

Use VPN for:

- remote administration
- private dashboard access
- diagnostics
- future site-to-site connectivity

## Security Rule

Do not expose admin dashboards directly to the public internet.

Prefer:

```text
Admin Device -> VPN -> LISA Edge
```

## Enable

In `.env`:

```env
LISA_COMPOSE_SERVICES="vpn-tailscale"
TS_AUTHKEY=your-auth-key
```

Then deploy:

```bash
sudo ./scripts/deploy.sh
```
