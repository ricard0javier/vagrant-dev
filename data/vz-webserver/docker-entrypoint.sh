#!/bin/bash
set -e

# start listening from 9000 to execute php code
php-fpm &

# set nginx to serve all server definitions on /ricardovz/nginx
mkdir -p /ricardovz/domainName/conf
touch /ricardovz/domainName/conf/nginx-domainName

# set the folder permisions
for file in /ricardovz/*;
	do chown -R www-data:www-data "$file";
done

# copy the nginx configurations
for file in /ricardovz/*/conf/nginx-*;
	do cp -f "$file" /etc/nginx/sites-enabled/;
done

exec "$@"