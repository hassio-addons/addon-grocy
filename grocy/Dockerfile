ARG BUILD_FROM=hassioaddons/base:4.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
RUN \
    apk add --no-cache \
        nginx=1.16.0-r2 \
        php7-fpm=7.3.6-r0 \
        php7-json=7.3.6-r0 \
        php7-mbstring=7.3.6-r0 \
        php7-opcache=7.3.6-r0 \
        php7-pdo_sqlite=7.3.6-r0 \
        php7-pdo=7.3.6-r0 \
        php7-tokenizer=7.3.6-r0 \
        php7-fileinfo=7.3.6-r0 \
        php7=7.3.6-r0 \
    \
    && apk add --no-cache --virtual .build-dependencies \
        git=2.22.0-r0 \
        yarn=1.16.0-r0 \
        composer=1.8.6-r0 \
    \
    && yarn global add modclean \
    \
    && git clone --branch "v2.4.2" --depth=1 \
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
    && apk del --purge .build-dependencies \
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
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Grocy" \
    io.hass.description="ERP beyond your fridge! A groceries & household management solution for your home" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="ERP beyond your fridge! A groceries & household management solution for your home" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Grocy" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-grocy/112422?u=frenck" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-grocy/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-grocy" \
    org.label-schema.vendor="Community Hass.io Addons"
