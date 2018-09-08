FROM imxieke/ubuntu:bionic

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ADD script/build.sh /build.sh
ADD script/start.sh /bin/start.sh
ADD conf.d/index.php /var/www/
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt update -y --fix-missing \
    && apt install -y --no-install-recommends  nginx php7.2-fpm php-memcache php-memcached php7.2-dev php7.2-bcmath php7.2-bz2 php7.2-curl php7.2-dba php7.2-enchant php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-zip php7.2-mbstring php7.2-mysql  php7.2-odbc php7.2-pgsql php7.2-readline php7.2-recode php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip libmcrypt-dev \
    wget make g++ ca-certificates\
    && rm -fr /etc/nginx/nginx.conf \
    && rm -fr /etc/nginx/conf.d/* \
    && mkdir -p /run/nginx/ \
    && chmod 755 -R /var/www \
    && chown -R www-data:www-data /var/www \
    && chmod +x /build.sh \
    && chmod +x /bin/start.sh \
    && bash /build.sh \
    && apt autoremove -y \
    && apt-get clean all \
    && rm -fr /var/lib/apt/lists/*

ADD conf.d/nginx.conf /etc/nginx/
ADD conf.d/default.conf /etc/nginx/conf.d/
EXPOSE 80
CMD /bin/start.sh