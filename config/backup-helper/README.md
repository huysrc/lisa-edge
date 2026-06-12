# LISA Edge backup helper

This directory is mounted read-only into the `backup-helper` container.
The real backup is executed by `scripts/backup.sh` on the host because it needs Docker Compose control and filesystem access.
