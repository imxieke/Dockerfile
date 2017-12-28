#latest ownCloud in Docker!
FROM imxieke/php:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"
ENV NAME nextcloud
RUN wget https://download.${NAME}.com/server/releases/latest.zip -O /tmp/${NAME}.zip \
        && rm -fr /var/www/* \
        && unzip /tmp/${NAME}.zip -d /tmp/ \
        && mv /tmp/${NAME}/* /var/www/ \
        && rm -fr /tmp/* \
        && chmod 777 -R /var/www/

EXPOSE 80
CMD nginx && /usr/sbin/php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.d/www.conf
