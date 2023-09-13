ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.1.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG GROCY_VERSION="v4.0.3"
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        composer=2.5.8-r0 \
        nginx=1.24.0-r6 \
        patch=2.7.6-r10 \
        php81-ctype=8.1.23-r0 \
        php81-exif=8.1.23-r0 \
        php81-fileinfo=8.1.23-r0 \
        php81-fpm=8.1.23-r0 \
        php81-gd=8.1.23-r0 \
        php81-iconv=8.1.23-r0 \
        php81-intl=8.1.23-r0 \
        php81-ldap=8.1.23-r0 \
        php81-mbstring=8.1.23-r0 \
        php81-opcache=8.1.23-r0 \
        php81-pdo_sqlite=8.1.23-r0 \
        php81-pdo=8.1.23-r0 \
        php81-simplexml=8.1.23-r0 \
        php81-tokenizer=8.1.23-r0 \
        php81=8.1.23-r0 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.40.1-r0 \
        php81-openssl=8.1.23-r0 \
        php81-phar=8.1.23-r0 \
        yarn=1.22.19-r0 \
    \
    && yarn global add modclean \
    \
    && git clone --branch "${GROCY_VERSION}" --depth=1 \
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
        /etc/nginx \
        /etc/php8/php-fpm.d/www.conf \
        /root/.composer \
        /tmp/* \
        /usr/lib/node_modules \
        /usr/local/bin/composer \
        /usr/local/share/.cache \
        /var/www/grocy/.git \
        /var/www/grocy/.tx \
        /var/www/grocy/.vscode \
        /var/www/grocy/build_tools \
        /var/www/grocy/build.bat

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
