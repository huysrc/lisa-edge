# Secrets

Do not commit secrets to Git.

Examples of secrets:

- `.env`
- MQTT passwords
- Tailscale auth keys
- OTBR dataset files
- private keys
- certificates
- backup encryption keys

Use `.env.example` only for safe placeholders.

For production, consider:

- password manager
- SOPS + age
- encrypted restic repository
- offline encrypted backup copy
