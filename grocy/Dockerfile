ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.1.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        nginx=1.18.0-r13 \
        php7-fpm=7.4.14-r0 \
        php7-gd=7.4.14-r0 \
        php7-json=7.4.14-r0 \
        php7-mbstring=7.4.14-r0 \
        php7-opcache==7.4.14-r0 \
        php7-pdo_sqlite=7.4.14-r0 \
        php7-pdo==7.4.14-r0 \
        php7-simplexml=7.4.14-r0 \
        php7-tokenizer=7.4.14-r0 \
        php7-fileinfo=7.4.14-r0 \
        php7=7.4.14-r0 \
        php7-ctype=7.4.14-r0 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.30.0-r0 \
        yarn=1.22.10-r0 \
        composer=2.0.8-r0 \
    \
    && yarn global add modclean \
    \
    && git clone --branch "v3.0.1" --depth=1 \
        https://github.com/grocy/grocy.git /var/www/grocy \
    \
    && cd /var/www/grocy \
    \
    && composer install --no-dev \
    && yarn --production \
    \
    && modclean \
        --path /var/www/grocy/public \
        --no-progress \
        --keep-empty \
        --run \
    \
    && yarn global remove modclean \
    && yarn cache clean \
    && apk del --no-cache --purge .build-dependencies \
    \
    && find /var/www/ -type f -name "*.md" -depth -exec rm -f {} \; \
    && rm -f -r \
        /tmp/* \
        /etc/nginx \
        /usr/local/share/.cache \
        /usr/lib/node_modules \
        /var/www/grocy/.git \
        /var/www/grocy/.tx \
        /var/www/grocy/.vscode \
        /var/www/grocy/build.bat \
        /var/www/grocy/build_tools

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
