#!/usr/bin/env sh

apk --update add autoconf make gcc libc-dev nginx git

EXPECTED_COMPOSER_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_COMPOSER_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit
fi

php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet

rm composer-setup.php

composer global require hirak/prestissimo

docker-php-ext-install pdo_mysql json opcache

pecl install xdebug-2.6.0alpha1

docker-php-source delete

apk del autoconf gcc libc-dev
