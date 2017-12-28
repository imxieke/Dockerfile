FROM imxieke/php:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"
RUN echo "==> Download KodCloud " \
  && wget https://github.com/kalcaddle/KodExplorer/archive/master.zip \
  && unzip master.zip && mv KodExplorer-master /var/www/Cloud && rm -fr *.zip*

EXPOSE 80
CMD nginx && /usr/sbin/php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.d/www.conf
