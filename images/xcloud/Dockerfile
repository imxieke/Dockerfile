FROM imxieke/php:latest

# Description: NextCloud Aria2 AriaNg yaaw h5ai

LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"

RUN apk update \
  && echo "==> Install Aria2" \
	&& apk add --no-cache aria2 \
  && cd /tmp/ \
  && echo "==> Download AriaNg" \
  && wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip \
  && unzip master.zip && rm -fr master.zip \
  && mv AriaNg-DailyBuild-master /var/www/ariang \
  && echo "==> Download NextCloud " \
  && wget https://download.nextcloud.com/server/releases/latest.zip \
  && unzip latest.zip -d /var/www && rm -fr latest.zip \
  && echo "==> Download h5ai" \
  && wget https://release.larsjung.de/h5ai/h5ai-0.29.0.zip \
  && mkdir -p /var/www/h5ai \
  && unzip h5ai-0.29.0.zip -d /var/www/h5ai \
  && echo "==> Download yaaw" \
  && wget https://github.com/binux/yaaw/archive/master.zip \
  && unzip master.zip && rm -fr master.zip && mv yaaw-master /var/www/yaaw \
  && echo "==> Download KodCloud " \
  && wget https://github.com/kalcaddle/KodExplorer/archive/master.zip \
  && unzip master.zip && mv KodExplorer-master /var/www/Cloud && rm -fr *.zip* \
  && chmod 777 -R /var/www \
  && echo "Clear Environment" \
  && rm -fr /var/cache/apk/* \
  && rm -fr /etc/nginx/conf.d/* \
  && rm -fr /tmp/*

ADD default.conf /etc/nginx/conf.d/default.conf
CMD nginx && /usr/sbin/php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.d/www.conf
