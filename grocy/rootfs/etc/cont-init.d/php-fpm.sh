#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Grocy
# Configures PHP-FPM for use with Grocy
# ==============================================================================

# Generate Ingress configuration
bashio::var.json \
    name "ingress" \
    port "^9002" \
    base "$(bashio::addon.ingress_entry)" \
    | tempio \
        -template /etc/php7/templates/php-fpm.gtpl \
        -out /etc/php7/php-fpm.d/ingress.conf

# Generate direct access configuration, if enabled.
if bashio::var.has_value "$(bashio::addon.port 80)"; then
    bashio::var.json \
        name "www" \
        port "^9001" \
        | tempio \
            -template /etc/php7/templates/php-fpm.gtpl \
            -out /etc/php7/php-fpm.d/www.conf
fi
