FROM imxieke/ubuntu:bionic

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ADD script/env.sh /env.sh
ADD script/start.sh /bin/start.sh
ADD conf.d/index.php /var/www/
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && chmod +x /env.sh \
    && chmod +x /bin/start.sh \
    && bash /env.sh \
    && apt autoremove -y \
    && apt-get clean all \
    && rm -fr /var/lib/apt/lists/*

ADD conf.d/*.example /etc/nginx/conf.d/
EXPOSE 80
CMD /bin/start.sh