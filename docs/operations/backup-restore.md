# Backup and Restore

LISA Edge is designed to be rebuildable.

Back up:

- `.env`
- Docker volumes
- service configuration
- secrets
- OTBR Thread dataset if OTBR is used
- VPN state if Tailscale is used

## Backup

```bash
sudo ./scripts/backup.sh
```

## Restore

```bash
sudo ./scripts/restore.sh /path/to/lisa-edge-backup.tar.gz
```

## Production Recommendation

Store backups outside the edge host:

- NAS
- external SSD
- encrypted restic repository
- offline archive
