FROM imxieke/ubuntu:bionic

LABEL MAINTAINER="Cloudflying" \
        MAIL="oss@live.hk"

ADD script/build.sh /build.sh
ADD conf.d/index.php /var/www/
ENV HOME_DIR=/home/dev/
WORKDIR /home/dev
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && apt update -y --fix-missing \
    && apt install -y --no-install-recommends  nginx php7.2-fpm php7.2-dev php7.2-bcmath php7.2-bz2 php7.2-curl php7.2-dba php7.2-enchant php7.2-gd php7.2-gmp php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-zip php7.2-mbstring php7.2-mysql  php7.2-odbc php7.2-pgsql php7.2-readline php7.2-recode php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xmlrpc php7.2-xsl php7.2-zip libmcrypt-dev \
    git zsh wget curl unzip python python3 python-pip python3-pip net-tools ca-certificates apt-transport-https sudo make cmake g++ \
    && rm -fr /etc/nginx/nginx.conf \
    && rm -fr /etc/nginx/conf.d/* \
    && mkdir -p /run/nginx/ \
    && chmod 755 -R /var/www \
    && chown -R www-data:www-data /var/www \
    && rm -fr /etc/php/7.2/cli/php.ini \
    && rm -fr /etc/php/7.2/fpm/php.ini \
    && useradd -d /home/dev -m -s /bin/zsh dev \
    && git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ${HOME_DIR}/.oh-my-zsh \
    && cp ${HOME_DIR}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME_DIR}/.zshrc \
    && chsh -s /bin/zsh \
    && echo "dev:123456" | chpasswd \
    && echo "dev ALL=(ALL:ALL) ALL " >> /etc/sudoers \
    && chmod -R 755 $HOME_DIR \
    && chown -R dev:dev $HOME_DIR \
    &&  chmod +x /build.sh \
    && bash /build.sh \
    && apt autoremove -y \
    && apt-get clean all \
    && rm -fr /var/lib/apt/lists/*

USER dev
ADD conf.d/nginx.conf /etc/nginx/
ADD conf.d/default.conf /etc/nginx/conf.d/
# ADD conf.d/php.ini /etc/php/7.2/cli/
# ADD conf.d/php.ini /etc/php/7.2/fpm/
EXPOSE 22 80 3306 8888
CMD ['bash']