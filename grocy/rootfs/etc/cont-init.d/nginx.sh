#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Grocy
# Configures NGINX for use with Grocy
# ==============================================================================
declare certfile
declare keyfile

bashio::config.require.ssl

if bashio::config.true 'ssl'; then
    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    mv /etc/nginx/servers/direct-ssl.disabled /etc/nginx/servers/direct.conf
    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/servers/direct.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/servers/direct.conf
else
    mv /etc/nginx/servers/direct.disabled /etc/nginx/servers/direct.conf
fi
