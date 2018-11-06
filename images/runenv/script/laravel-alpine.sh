#!/usr/bin/bash sh

echo "=> Update Local Software"
apk update 
apk upgrade
echo "=> Insatll Software "
apk add shadow sudo neovim git zsh wget curl jq openssl nginx php7-fpm php7-openssl php7-mysqli php7-intl php7-openssl php7-dba \
		php7-pear php7-tokenizer php7-phpdbg php7-litespeed php7-gmp php7-pdo_mysql php7-oauth php7-xsl php7-fpm php7-mysqlnd \
		php7-enchant php7-pspell php7-redis php7-snmp php7-pcntl php7-doc php7-fileinfo php7-mbstring php7-dev php7-xmlrpc \
		php7-xmlreader php7-pdo_sqlite php7-exif php7-recode php7-opcache php7-ldap php7-posix php7-session php7-gd php7-gettext \
		php7-mailparse php7-json php7-xml php7-iconv php7-sysvshm php7-curl php7-shmop php7-odbc php7-phar php7-pdo_pgsql php7-imap \
		php7-pdo_dblib php7-pgsql php7-pdo_odbc php7-xdebug php7-zip php7-ctype php7-amqp php7-mcrypt php7-bcmath php7-calendar \
		php7-tidy  php7-dom php7-sockets php7-zmq php7-memcached php7-soap php7-apcu php7-sysvmsg php7-zlib php7-embed php7-ftp \
		php7-pdo php7-bz2 php7-simplexml php7-xmlwriter php7-sqlite3 composer

apk update
echo "=> Clean Cache And Package"
rm -fr /var/cache/apk/*
rm -fr /tmp/*

echo "=> Create User ${USER} And Change Password"
useradd -d /home/${USER} -m -s /bin/sh ${USER}
echo "${USER}:${PASSWD}" | chpasswd
echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
echo '=> Config oh my zsh'
echo "=> Cloning oh my zsh to $HOME"
git clone --depth=1 https://git.dev.tencent.com/imxieke/ohmyzsh.git ${HOME}/.oh-my-zsh
cp ${HOME}/.oh-my-zsh/templates/zshrc.zsh-template ${HOME}/.zshrc
chown -R ${USER}:${USER} ${HOME}
sed -i "s/${USER}:\/bin\/sh/${USER}:\/bin\/zsh/g" /etc/passwd


sudo -Hu ${USER} composer config -g repo.packagist composer https://packagist.laravel-china.org