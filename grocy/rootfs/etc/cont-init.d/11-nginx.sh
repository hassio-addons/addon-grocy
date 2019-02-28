#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Grocy
# Configures NGINX for use with Grocy
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

declare certfile
declare keyfile

if hass.config.true 'ssl'; then
    rm /etc/nginx/nginx.conf
    mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

    certfile=$(hass.config.get 'certfile')
    keyfile=$(hass.config.get 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx.conf
fi
