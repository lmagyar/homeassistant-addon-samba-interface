ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:18.0.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Environment variables
ENV \
    LANG="C.UTF-8" \
    # Add-on log format
    LOG_FORMAT="{TIMESTAMP} {LEVEL}: {MESSAGE}" \
    LOG_TIMESTAMP="%Y-%m-%d %H:%M:%S"

# Setup base
RUN \
    apk add --no-cache \
        samba=4.21.4-r4 \
    \
    && mkdir -p /var/lib/samba \
    && touch \
        /etc/samba/lmhosts \
        /var/lib/samba/account_policy.tdb \
        /var/lib/samba/registry.tdb \
        /var/lib/samba/winbindd_idmap.tdb

# Copy root filesystem
COPY rootfs /

HEALTHCHECK \
    CMD healthcheck
