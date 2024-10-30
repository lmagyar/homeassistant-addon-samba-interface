ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:16.3.4
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Environment variables
ENV \
    LANG C.UTF-8

# Setup base
RUN \
    apk add --no-cache \
        samba=4.19.9-r0 \
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
    CMD smbclient -L '\\localhost' -U '%' -m SMB3
