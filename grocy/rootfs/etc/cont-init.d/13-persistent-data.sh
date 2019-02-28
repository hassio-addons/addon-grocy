#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: Grocy
# Ensures data is store in a persistent location
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

if ! hass.directory_exists "/data/grocy"; then
    hass.log.debug 'Data directory not initialized, doing that now...'

    # Setup structure
    cp -R /var/www/grocy/data /data/grocy

    # Ensure file permissions
    chown -R nginx:nginx /data/grocy
    find /data/grocy -not -perm 0644 -type f -exec chmod 0644 {} \;
    find /data/grocy -not -perm 0755 -type d -exec chmod 0755 {} \;
fi

hass.log.debug 'Symlinking data directory to persistent storage location...'
rm -f -r /var/www/grocy/data
ln -s /data/grocy /var/www/grocy/data
