#!/usr/bin/env sh

apk --update add nginx

./install-composer.sh

composer global require hirak/prestissimo
