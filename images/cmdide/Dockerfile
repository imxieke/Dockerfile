FROM imxieke/php:multiple
LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ADD script/build.sh /build.sh
ADD script/run.sh /bin/cmdide.sh

ENV RUN_MODE="local"
ENV USER "cmdide"
ENV PASSWD "cmdide"
ENV AUTHORIZED_KEYS **None**
ENV HOME_DIR=/home/$USER

RUN chmod +x /build.sh \
	&& chmod +x /bin/cmdide.sh \
    && bash /build.sh

USER $USER
WORKDIR $HOME_DIR

VOLUME ['/var/www'] 
VOLUME ['/etc/nginx/conf.d/'] 
EXPOSE 22 80 1025 3306 8025 8888 11211

CMD /bin/cmdide.sh