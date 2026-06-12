# Diagnostics

Use the diagnostic script to collect basic information:

```bash
sudo ./scripts/collect-diag.sh
```

Common checks:

```bash
docker ps
sudo ./scripts/healthcheck.sh
journalctl -u lisa-edge.service -n 100 --no-pager
```

For service-specific diagnostics, check the matching service document under `docs/services/`.
