FROM daocloud.io/xiekers/php:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"
RUN echo "==> Download KodCloud " \
  && cd /tmp \
  && wget https://github.com/kalcaddle/KodExplorer/archive/master.zip -O KodExplorer.zip \
  && rm -fr /var/www/* \
  && unzip KodExplorer.zip \
  && mv KodExplorer-master/* /var/www/ \
  && "==> Set Permision" \
  && chmod -R 777 /var/www \
  && rm -fr KodExplorer.zip

EXPOSE 80
CMD /bin/start
