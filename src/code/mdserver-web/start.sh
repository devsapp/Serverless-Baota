#!/usr/bin/env bash
set +e

rm -rf /wwwroot /root/.acme.sh
ln -s /mnt/auto/$FC_FUNCTION_NAME /wwwroot
ln -s /mnt/auto/$FC_FUNCTION_NAME/acme.sh /root/.acme.sh

mkdir /wwwroot/session

s config add --SecurityToken $ALIBABA_CLOUD_SECURITY_TOKEN --AccessKeyID $ALIBABA_CLOUD_ACCESS_KEY_ID --AccessKeySecret $ALIBABA_CLOUD_ACCESS_KEY_SECRET --AccountID $FC_ACCOUNT_ID -a aliyunfc

cd /wwwroot && python3 app.py

# sleep 5

# while true
# do
#     echo "check nginx and php-fpm process ...."
#     nginx_server=`ps aux | grep nginx | grep -v grep`
#     if [ ! "$nginx_server" ]; then
#         echo "restart nginx ..."
#         nginx -c /code/nginx.conf
#     fi
#     php_fpm_server=`ps aux | grep php-fpm | grep -v grep`
#     if [ ! "$php_fpm_server" ]; then
#         echo "restart php-fpm ..."
#         php-fpm7.4 -c /code/php.ini-production -y /code/php-fpm.conf
#     fi
#     sleep 10
# done