#!/usr/bin/env bash

# Set Xdebug
echo "Setting Xdebug..."
if [[ "${ENABLE_XDEBUG}" == "true" ]];
then
    echo "-- With Xdebug"
    [ -f /usr/local/etc/php/disabled/xdebug.ini ] && cd /usr/local/etc/php/ && mv disabled/xdebug.ini conf.d/ || echo "Xdebug already enabled"
else
    echo "-- Without Xdebug"
fi

exec "$@"
