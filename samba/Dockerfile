ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:14.2.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Environment variables
ENV \
    LANG C.UTF-8

# Setup base
RUN \
    apk add --no-cache \
        samba-common-tools=4.18.5-r0 \
        samba-server=4.18.5-r0 \
    \
    && mkdir -p /var/lib/samba \
    && touch \
        /etc/samba/lmhosts \
        /var/lib/samba/account_policy.tdb \
        /var/lib/samba/registry.tdb \
        /var/lib/samba/winbindd_idmap.tdb

# Copy root filesystem
COPY rootfs /
