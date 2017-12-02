#!/usr/bin/env sh

php-fpm --allow-to-run-as-root --fpm-config /etc/php/fpm/php-fpm.conf -c /etc/php/fpm/php.ini

exec nginx
