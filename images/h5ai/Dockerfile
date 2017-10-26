FROM imxieke/php7:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"

WORKDIR /var/www
RUN wget https://release.larsjung.de/h5ai/h5ai-0.29.0.zip -O /tmp/h5ai.zip \
		&& rm -fr /var/www/* \
		&& rm -fr /etc/nginx/conf.d/* \
		&& unzip /tmp/h5ai.zip -d /var/www \
		&& chmod 777 -R /var/www

ADD default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD nginx && /usr/sbin/php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.d/www.conf