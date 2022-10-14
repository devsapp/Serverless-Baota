#!/usr/bin/env bash
set +e

ln -s /mnt/auto /wwwroot

chown -R www-data:www-data /wwwroot/code/web

echo "start nginx"
nginx -c /wwwroot/code/nginx.conf

sleep 5

while true
do
    echo "check nginx process ..."
    nginx_server=`ps aux | grep nginx | grep -v grep`
    if [ ! "$nginx_server" ]; then
        echo "restart nginx ..."
        nginx -c /wwwroot/code/nginx.conf
    fi
    sleep 10
done