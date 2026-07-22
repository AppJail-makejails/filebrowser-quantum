ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/core:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="FileBrowser Quantum" \
    org.opencontainers.image.description="Stylish web-based file browser" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/filebrowser-quantum" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/filebrowser-quantum" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install -U filebrowser-quantum; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

VOLUME ["/usr/local/www/filebrowser-quantum", "/var/db/filebrowser-quantum"]

ENTRYPOINT ["/entrypoint.sh"]
