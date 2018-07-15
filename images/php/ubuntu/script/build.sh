#!/usr/bin/env bash

mongodb(){
	# wget http://pecl.php.net/get/mongodb-1.5.1.tgz
	cd $BUILD_DIR
	NAME='mongodb'
	MONGODB_VER="1.5.1"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/mongodb-$MONGODB_VER.tgz
	tar zxvf $NAME-$MONGODB_VER.tgz && cd $NAME-$MONGODB_VER
	phpize && ./configure && make -j4 && make install 
	echo "extension=mongodb.so" > /etc/php/7.2/cli/conf.d/mongodb.ini
	echo "extension=mongodb.so" > /etc/php/7.2/fpm/conf.d/mongodb.ini
}

redis(){
	cd $BUILD_DIR
	REDIS_VER="4.1.0"
	# wget https://pecl.php.net/get/redis-4.1.0.tgz
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/redis-$REDIS_VER.tgz
	tar zxvf redis-$REDIS_VER.tgz && cd redis-$REDIS_VER
	phpize && ./configure && make -j4 && make install 
	echo "extension=redis.so" > /etc/php/7.2/cli/conf.d/redis.ini
	echo "extension=redis.so" > /etc/php/7.2/fpm/conf.d/redis.ini
}

rar(){
	cd $BUILD_DIR
	RAR_VER="4.0.0"
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/rar-$RAR_VER.tgz
	tar zxvf rar-$RAR_VER.tgz && cd rar-$RAR_VER
	phpize && ./configure && make -j4 && make install
	echo "extension=rar.so" > /etc/php/7.2/cli/conf.d/rar.ini
	echo "extension=rar.so" > /etc/php/7.2/fpm/conf.d/rar.ini
	# wget https://pecl.php.net/get/rar-4.0.0.tgz
}

swoole(){
	cd $BUILD_DIR
	SWOOLE_VER="4.0.1"
	# wget https://pecl.php.net/get/swoole-4.0.1.tgz
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/swoole-$SWOOLE_VER.tgz
	tar zxvf swoole-$SWOOLE_VER.tgz && cd swoole-$SWOOLE_VER
	phpize && ./configure && make -j4 && make install
	echo "extension=swoole.so" > /etc/php/7.2/cli/conf.d/swoole.ini
	echo "extension=swoole.so" > /etc/php/7.2/fpm/conf.d/swoole.ini
}

mcrypt(){
	cd $BUILD_DIR
	MCRYPT_VER="1.0.1"
	# wget https://pecl.php.net/get/mcrypt-1.0.1.tgz
	wget https://coding.net/u/imxieke/p/attachment/git/raw/master/src/mcrypt-$MCRYPT_VER.tgz
	tar zxvf mcrypt-$MCRYPT_VER.tgz && cd mcrypt-$MCRYPT_VER
	phpize && ./configure && make -j4 && make install
	echo "extension=mcrypt.so" > /etc/php/7.2/cli/conf.d/mcrypt.ini
	echo "extension=mcrypt.so" > /etc/php/7.2/fpm/conf.d/mcrypt.ini
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