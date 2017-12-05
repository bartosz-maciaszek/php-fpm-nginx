#!/usr/bin/env sh

if [[ "$ENABLE_XDEBUG" == "1" ]]; then
  docker-php-ext-enable xdebug

  XdebugFile='/usr/local/etc/php/conf.d/30-xdebug.ini'

  echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > $XdebugFile
  echo "xdebug.remote_enable=1" >> $XdebugFile
  echo "xdebug.remote_log=/tmp/xdebug.log" >> $XdebugFile
  echo "xdebug.remote_autostart=false" >> $XdebugFile
fi

php-fpm --allow-to-run-as-root --fpm-config /etc/php/fpm/php-fpm.conf -c /etc/php/fpm/php.ini

exec nginx
