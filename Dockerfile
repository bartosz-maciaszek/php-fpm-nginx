FROM php:7.2-fpm-alpine
MAINTAINER Bartosz Maciaszek <bartosz.maciaszek@gmail.com>

EXPOSE 80

ENV ENABLE_XDEBUG 0
ENV COMPOSER_ALLOW_SUPERUSER 1

ADD etc /etc
ADD public /var/www/html

ADD scripts/build.sh /build.sh
RUN chmod +x /build.sh; sync; /build.sh; rm -f /build.sh

ADD scripts/start.sh /start.sh
RUN chmod +x /start.sh; sync
CMD ["/start.sh"]
