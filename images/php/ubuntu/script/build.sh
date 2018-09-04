#!/usr/bin/env bash

msgpack(){
	cd $BUILD_DIR
	PKG_NAME="msgpack"
	PKG_VER="2.0.2"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

yaml(){
	cd $BUILD_DIR
	PKG_NAME="yaml"
	PKG_VER="2.0.2"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

yaf(){
	cd $BUILD_DIR
	PKG_NAME="yaf"
	PKG_VER="3.0.7"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

yar(){
	cd $BUILD_DIR
	PKG_NAME="yar"
	PKG_VER="2.0.4"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure --enable-msgpack && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

mongodb(){
	# wget http://pecl.php.net/get/mongodb-1.5.1.tgz
	cd $BUILD_DIR
	PKG_NAME='mongodb'
	PKG_VER="1.5.1"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

redis(){
	cd $BUILD_DIR
	PKG_NAME="redis"
	PKG_VER="4.1.0"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install 
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

rar(){
	cd $BUILD_DIR
	PKG_NAME="rar"
	PKG_VER="4.0.0"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
	# wget https://pecl.php.net/get/rar-4.0.0.tgz
}

swoole(){
	cd $BUILD_DIR
	PKG_NAME="swoole"
	PKG_VER="4.0.1"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

mcrypt(){
	cd $BUILD_DIR
	PKG_NAME="mcrypt"
	PKG_VER="1.0.1"
	# wget https://pecl.php.net/get/mcrypt-1.0.1.tgz
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/${PKG_NAME}-${PKG_VER}.tgz
	tar zxvf ${PKG_NAME}-${PKG_VER}.tgz && cd ${PKG_NAME}-${PKG_VER}
	phpize && ./configure && make -j4 && make install
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/cli/conf.d/${PKG_NAME}.ini
	echo "extension=${PKG_NAME}.so" > /etc/php/7.2/fpm/conf.d/${PKG_NAME}.ini
}

ioncube(){
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/ioncube/ioncube_loader_lin_7.2.so -O /usr/lib/php/20170718/ioncube.so
	echo "zend_extension = ioncube.so" >> /etc/php/7.2/cli/php.ini
	echo "zend_extension = ioncube.so" >> /etc/php/7.2/fpm/php.ini
}

install_ext(){
	BUILD_DIR="/tmp/phpbuild"
	mkdir -p $BUILD_DIR
	cd $BUILD_DIR
	msgpack
	yaf
	yaml
	yar
	mongodb
	redis
	rar
	swoole
	mcrypt
	ioncube
	apt purge -y g++ make wget
	rm -fr /tmp/*
}

install_ext