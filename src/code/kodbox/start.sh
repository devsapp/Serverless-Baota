#!/usr/bin/env bash
set +e

ln -s /mnt/auto /wwwroot

mkdir -p /tmp/log/nginx/
mkdir -p /tmp/var/nginx/
mkdir -p /tmp/var/sessions/

mkdir -p /wwwroot/kodbox-1.34.04/sessions
chown -R root:root /wwwroot/kodbox-1.34.04/sessions
chown -R root:root /wwwroot/kodbox-1.34.04

echo "start php-fpm"
php-fpm7.4 -R -c /code/php.ini -y /code/php-fpm.conf

echo "start nginx"
nginx -c /code/nginx.conf

sleep 5

while true
do
    echo "check nginx and php-fpm process ...."
    nginx_server=`ps aux | grep nginx | grep -v grep`
    if [ ! "$nginx_server" ]; then
        echo "restart nginx ..."
        nginx -c /code/nginx.conf
    fi
    php_fpm_server=`ps aux | grep php-fpm | grep -v grep`
    if [ ! "$php_fpm_server" ]; then
        echo "restart php-fpm ..."
        php-fpm7.4 -c /code/php.ini-production -y /code/php-fpm.conf
    fi
    sleep 10
done