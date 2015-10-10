#!/bin/bash
ACTION=${1:-}

function clean {
    rm /etc/apache2/conf-available/netdot.conf && rm /etc/apache2/conf-enabled/netdot.conf
    ln -s /usr/local/netdot/etc/netdot_apache24_local.conf /etc/apache2/conf-available/netdot.conf
}

if [ "$ACTION" = "init" ] ; then
    clean
    echo "
This may take a moment while apache and mysql starts..."
    echo "Starting Mysql..."
    service mysql restart
    sleep 4
    echo "Starting Apache.."
    echo "initializing..."
    service apache2 restart
    echo "Configuring Apache..."
    a2enconf netdot && service apache2 reload
    sleep 4
    echo "
Netdot is ready
You should be able to login on http://<docker-host-ip>:8888/netdot/
"
fi
