#!/bin/bash

MODE_TYPE=$1
DOMAIN_NAME=$2

# Download letsencrypt scripts
cd ~
if [ ! -d "letsencrypt" ]; then
  git clone https://github.com/letsencrypt/letsencrypt.git
fi
cd letsencrypt

# Generate key
./letsencrypt-auto certonly --renew-by-default --verbose --agree-tos --webroot --webroot-path /usr/share/nginx/www -d $DOMAIN_NAME
openssl dhparam -out /etc/ssl/private/dhparam.pem 4096

# Update nginx config
if [ "$MODE_TYPE" != "renew" ]; then
  sed -e "s/localhost/$DOMAIN_NAME/g" ~/ssl-nginx.conf > /etc/nginx/site-available/default
  service nginx configtest
  service nginx restart &
fi
