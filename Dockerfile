# ==========================================================================
# Custom Caddy with rate-limit plugin
#
# This image is published to ghcr.io/qntx/caddy-ratelimit
# and can be used as a drop-in replacement for the official caddy image.
#
# Included plugins:
#   - github.com/mholt/caddy-ratelimit
# ==========================================================================

FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
