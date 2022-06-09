#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Grocy
# Sets up Grocy before the server starts
# ==============================================================================
if ! bashio::fs.directory_exists "/data/grocy"; then
    bashio::log.debug 'Data directory not initialized, doing that now...'

    # Setup structure
    cp -R /var/www/grocy/data /data/grocy

    # Ensure file permissions
    chown -R nginx:nginx /data/grocy
    find /data/grocy -not -perm 0644 -type f -exec chmod 0644 {} \;
    find /data/grocy -not -perm 0755 -type d -exec chmod 0755 {} \;
fi

if ! bashio::fs.directory_exists "/data/grocy/viewcache"; then
    mkdir -p /data/grocy/viewcache
    chown nginx:nginx /data/grocy/viewcache
fi

bashio::log.debug 'Symlinking data directory to persistent storage location...'
rm -f -r /var/www/grocy/data
ln -s /data/grocy /var/www/grocy/data

# Patch current relative URL handling braindamage
bashio::log.info "Patching Grocy to fix relative URL handling..."
cd /var/www/grocy || bashio.exit.nok 'Failed cd'
patch -p1 < /patches/fix_braindamage.patch || true
