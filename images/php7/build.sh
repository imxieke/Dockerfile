#!/bin/sh
# Description: Build php extensions.
# time : 27 Dec 2017

SWOOLE_VER="2.0.10"
RAR_VER="4.0.0"
REDIS_VER="3.1.5"
IONCUBE_VER="10.1.0"
IMAGICK_VER="3.4.3"
cur_dir="/tmp"
build(){
	phpize && ./configure && make -j8 && make install
}

imagick(){
	name="imagick"
	cd ${cur_dir}
	wget https://pecl.php.net/get/${name}-${IMAGICK_VER}.tgz && tar -xvf ${name}-${IMAGICK_VER}.tgz
	cd ${name}-${IMAGICK_VER} && build
	echo "extension=${name}.so" > /etc/php7/conf.d/${name}.ini
}

swoole(){
	name="swoole"
	cd ${cur_dir}
	wget https://pecl.php.net/get/${name}-${SWOOLE_VER}.tgz && tar -xvf ${name}-${SWOOLE_VER}.tgz
	cd ${name}-${SWOOLE_VER}
	# have unknow error
	#if [ `cat /etc/os-release  | grep Alpine\ Linux` ]; then
		echo "Linux Aio Not Avaiable in Alpine Linux"
		sed -i 's/#define\ HAVE_LINUX_AIO/\/\/#define\ HAVE_LINUX_AIO/g' swoole_config.h
	#fi
	build
	echo "extension=${name}.so" > /etc/php7/conf.d/${name}.ini
}

rar(){
	name="rar"
	cd ${cur_dir}
	wget https://pecl.php.net/get/${name}-${RAR_VER}.tgz && tar -xvf ${name}-${RAR_VER}.tgz
	cd ${name}-${RAR_VER} && build
	echo "extension=${name}.so" > /etc/php7/conf.d/${name}.ini
}

redis(){
	name="redis"
	cd ${cur_dir}
	wget https://pecl.php.net/get/${name}-${REDIS_VER}.tgz && tar -xvf ${name}-${REDIS_VER}.tgz
	cd ${name}-${REDIS_VER} && build
	echo "extension=${name}.so" > /etc/php7/conf.d/${name}.ini
}

ioncube(){
	name="ioncube"
	cd ${cur_dir}
	wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip -O ${name}-${IONCUBE_VER}.zip && unzip ${name}-${IONCUBE_VER}
	mv ${name}/ioncube_loader_lin_7.1.so /usr/lib/php7/modules/${name}.so
	# echo "extension=${name}.so" > /etc/php7/conf.d/${name}.ini
}

start(){
	imagick
	swoole
	rar
	# redis
	ioncube
	cd ${cur_dir}
	rm -fr *.tgz* *.zip* /tmp/*
}

start