#!/usr/bin/env bash
set +e

ln -s /mnt/auto/$FC_FUNCTION_NAME /wwwroot

mkdir -p /tmp/log/nginx/
mkdir -p /tmp/var/nginx/
mkdir -p /tmp/var/sessions/

mkdir -p /wwwroot/sessions
chown -R root:root /wwwroot/sessions

chown -R root:root /wwwroot

echo "start php-fpm"
php-fpm7.4 -R -c /wwwroot/php.ini -y /wwwroot/php-fpm.conf

echo "start nginx"
nginx -c /wwwroot/nginx.conf

sleep 5

while true
do
    echo "check nginx and php-fpm process ...."
    nginx_server=`ps aux | grep nginx | grep -v grep`
    if [ ! "$nginx_server" ]; then
        echo "restart nginx ..."
        nginx -c /wwwroot/nginx.conf
    fi
    php_fpm_server=`ps aux | grep php-fpm | grep -v grep`
    if [ ! "$php_fpm_server" ]; then
        echo "restart php-fpm ..."
        php-fpm7.4 -c /wwwroot/php.ini-production -y /wwwroot/php-fpm.conf
    fi
    sleep 10
done