#!/usr/bin/env bash
php56() {
    update-alternatives --set php /usr/bin/php5.6
    update-alternatives --set php-config /usr/bin/php-config5.6
    update-alternatives --set phpize /usr/bin/phpize5.6
}

php70() {
    update-alternatives --set php /usr/bin/php7.0
    update-alternatives --set php-config /usr/bin/php-config7.0
    update-alternatives --set phpize /usr/bin/phpize7.0
}

php71() {
    update-alternatives --set php /usr/bin/php7.1
    update-alternatives --set php-config /usr/bin/php-config7.1
    update-alternatives --set phpize /usr/bin/phpize7.1
}

php72() {
    update-alternatives --set php /usr/bin/php7.2
    update-alternatives --set php-config /usr/bin/php-config7.2
    update-alternatives --set phpize /usr/bin/phpize7.2
}

php73() {
    update-alternatives --set php /usr/bin/php7.3
    update-alternatives --set php-config /usr/bin/php-config7.3
    update-alternatives --set phpize /usr/bin/phpize7.3
}

ioncube(){
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/ioncube/ioncube_loader_lin_7.2.so -O /usr/lib/php/20170718/ioncube.so
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/ioncube/ioncube_loader_lin_7.1.so -O /usr/lib/php/20160303/ioncube.so
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/ioncube/ioncube_loader_lin_7.0.so -O /usr/lib/php/20151012/ioncube.so
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/ioncube/ioncube_loader_lin_5.6.so -O /usr/lib/php/20131226/ioncube.so

	echo "zend_extension = ioncube.so" >> /etc/php/7.2/cli/php.ini
	echo "zend_extension = ioncube.so" >> /etc/php/7.2/fpm/php.ini

	echo "zend_extension = ioncube.so" >> /etc/php/7.1/cli/php.ini
	echo "zend_extension = ioncube.so" >> /etc/php/7.1/fpm/php.ini

	echo "zend_extension = ioncube.so" >> /etc/php/7.0/cli/php.ini
	echo "zend_extension = ioncube.so" >> /etc/php/7.0/fpm/php.ini

	echo "zend_extension = ioncube.so" >> /etc/php/5.6/cli/php.ini
	echo "zend_extension = ioncube.so" >> /etc/php/5.6/fpm/php.ini
}

# Install PHP Extensions
yaml(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="yaml"
	PKG_VER="2.0.2"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

yaconf(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="yaconf"
	PKG_VER="1.0.7"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

yaf(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="yaf"
	PKG_VER="3.0.7"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

mongodb(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME='mongodb'
	PKG_VER="1.5.1"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

redis(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="redis"
	PKG_VER="4.1.0"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

rar(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="rar"
	PKG_VER="4.0.0"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

swoole(){
	PHPVER=$1
	cd $BUILD_DIR
	PKG_NAME="swoole"
	PKG_VER="4.0.1"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/${PHPVER}/fpm/conf.d/${PKG_NAME}.ini
	cd .. && rm -fr ${PKG_NAME}-${PKG_VER}
}

php56ext(){
	php56
	yaml 5.6
	yaconf 5.6
	yaf 5.6
	yar 5.6
	mongodb 5.6
	redis 5.6
	rar 5.6
	swoole 5.6
}

php70ext(){
	php70
	yaml 7.0
	yaconf 7.0
	yaf 7.0
	yar 7.0
	mongodb 7.0
	redis 7.0
	rar 7.0
	swoole 7.0
}

php71ext(){
	php71
	yaml 7.1
	yaconf 7.1
	yaf 7.1
	yar 7.1
	mongodb 7.1
	redis 7.1
	rar 7.1
	swoole 7.1
}

php72ext(){
	php72
	yaconf 7.2
	yaf 7.2
	yaml 7.2
	yar 7.2
	mongodb 7.2
	redis 7.2
	rar 7.2
	swoole 7.2
}

php73ext(){
	php73
	yaconf 7.3
	yaf 7.3
	yaml 7.3
	yar 7.3
	mongodb 7.3
	redis 7.3
	swoole 7.3
}

install_ext(){
	BUILD_DIR="/tmp/phpbuild"
	mkdir -p $BUILD_DIR
	cd $BUILD_DIR
	ioncube
	# php56ext
	php70ext
	# php71ext
	# php72ext
	# php73ext
}

install_ext
apt purge -y g++ make wget
rm -fr /tmp/*