# Quick Start

## 1. Install Linux

Use Ubuntu Server or Debian.

## 2. Clone Repository

```bash
git clone https://github.com/huysrc/lisa-edge.git
cd lisa-edge
```

## 3. Create Environment File

```bash
cp .env.example .env
nano .env
```

At minimum, review:

- `DATA_ROOT`
- `BACKUP_DEST`
- bind addresses
- passwords
- optional service list

## 4. Bootstrap Host

```bash
sudo ./bootstrap/bootstrap.sh
```

## 5. Verify

```bash
sudo ./scripts/healthcheck.sh
```

## 6. Enable Optional Services

Edit `.env`:

```env
LISA_COMPOSE_SERVICES="otbr vpn-tailscale"
```

Then deploy:

```bash
sudo ./scripts/deploy.sh
```
