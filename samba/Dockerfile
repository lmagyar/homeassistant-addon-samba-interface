ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:13.2.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Environment variables
ENV \
    LANG C.UTF-8

# Setup base
RUN \
    apk add --no-cache \
        samba-common-tools \
        samba-server \
    \
    && mkdir -p /var/lib/samba \
    && touch \
        /etc/samba/lmhosts \
        /var/lib/samba/account_policy.tdb \
        /var/lib/samba/registry.tdb \
        /var/lib/samba/winbindd_idmap.tdb

# Copy root filesystem
COPY rootfs /
