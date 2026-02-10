# caddy-ratelimit

Pre-built [Caddy 2](https://caddyserver.com/) Docker image with the
[caddy-ratelimit](https://github.com/mholt/caddy-ratelimit) plugin included.

Published to **GitHub Container Registry** and rebuilt weekly to track upstream updates.

## Quick Start

```bash
docker pull ghcr.io/qntx/caddy-ratelimit:latest
```

### Docker Compose

```yaml
services:
  caddy:
    image: ghcr.io/qntx/caddy-ratelimit:latest
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile:ro
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```

### Caddyfile Example

```caddyfile
example.com {
    rate_limit {
        zone api {
            key    {remote_host}
            events 60
            window 1m
        }
    }

    reverse_proxy localhost:8080
}
```

## Included Plugins

| Plugin | Description |
|--------|-------------|
| [mholt/caddy-ratelimit](https://github.com/mholt/caddy-ratelimit) | HTTP rate limiting with configurable zones |

## Image Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest build from `main` branch |
| `v1.0.0` | Specific release version |
| `1.0`, `1` | Major/minor version aliases |
| `<sha>` | Git commit SHA |

## Platforms

- `linux/amd64`
- `linux/arm64`

## License

[MIT](LICENSE)
