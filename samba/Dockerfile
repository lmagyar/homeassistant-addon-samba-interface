ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:21.0.12
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Add env
ENV LANG=C.UTF-8

# Setup base
RUN \
    apk add --no-cache \
        samba=4.23.8-r0 \
        wsdd=0.9-r0 \
    \
    && mkdir -p /var/lib/samba \
    && touch \
        /etc/samba/lmhosts \
        /var/lib/samba/account_policy.tdb \
        /var/lib/samba/registry.tdb \
        /var/lib/samba/winbindd_idmap.tdb

# Copy root filesystem
COPY rootfs /

HEALTHCHECK --start-period=30s --start-interval=5s --interval=30s \
    CMD healthcheck

ENV \
    LOG_FORMAT="{LEVEL}: {MESSAGE}" \
    S6_STAGE2_HOOK=/etc/s6-overlay/scripts/enable-check.sh
