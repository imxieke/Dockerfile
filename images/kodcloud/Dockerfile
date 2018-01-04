FROM daocloud.io/xiekers/php:latest
LABEL MAINTAINER="Sky" \
        MAIL="Sky@gfw.party"
RUN echo "==> Download KodCloud " \
  && wget https://github.com/kalcaddle/KodExplorer/archive/master.zip \
  && unzip master.zip \
  && mv KodExplorer-master /var/www \
  && rm -fr *.zip*

EXPOSE 80
CMD /bin/start
