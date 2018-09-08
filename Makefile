IMAGES:="`pwd`/images"
# Push to DaoCloud Registry
PREFIX:="imxieke"
# PREFIX:="imxieke"
# Push to Docker Offcial Registry

all: # include all command (Function)

	@echo "Test Docker"

runphp7:
	docker run -d --name="php7" --hostname="php7" -v /home/imxieke/WorkSpaces/Volumes/php:/var/www -p 10080:80 imxieke/php7

runmariadb:
	docker run -d --name mariadb --hostname mariadb -v /home/imxieke/WorkSpaces/Volumes/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=19960318 -p 13306:3306 mariadb:10.3.2

alpine:
	@cd ${IMAGES}/alpine \
	&& docker build --no-cache -t ${PREFIX}/alpine:latest .

alpine-dev: 
	@cd ${IMAGES}/alpine \
	&& docker build --no-cache -t ${PREFIX}/alpine:dev --file=Dockerfile.dev .

buildbot:
	@cd ${IMAGES}/buildbot \
	&& docker build --no-cache -t ${PREFIX}/buildbot:latest .

cmdide:
	@cd ${IMAGES}/cmdide \
	&& docker build --no-cache -t ${PREFIX}/cmdide:latest .

debian:
	@cd ${IMAGES}/debian \
	&& docker build --no-cache -t ${PREFIX}/debian:latest .

debian-dev:
	@cd ${IMAGES}/debian \
	&& docker build --no-cache -t ${PREFIX}/debian:dev --file=Dockerfile.dev .

golang:
	@cd ${IMAGES}/golang \
	&& docker build --no-cache -t ${PREFIX}/golang:latest .

kodcloud:
	@cd ${IMAGES}/kodcloud \
	&& docker build --no-cache -t ${PREFIX}/kodcloud:latest .

php-alpine: 
	@cd ${IMAGES}/php/alpine \
	&& docker build --no-cache -t ${PREFIX}/php:alpine .
php: 
	@cd ${IMAGES}/php/ubuntu \
	&& docker build --no-cache -t ${PREFIX}/php:latest .

php-multiple: 
	@cd ${IMAGES}/php/multiple \
	&& docker build --no-cache -t ${PREFIX}/php:latest .

java:
	@cd ${IMAGES}/java \
	&& docker build --no-cache -t ${PREFIX}/java:latest .

java7:
	@cd ${IMAGES}/java \
	&& docker build --no-cache -t ${PREFIX}/java:7 --file=Dockerfile.7 .

java8:
	@cd ${IMAGES}/java \
	&& docker build --no-cache -t ${PREFIX}/java:8 --file=Dockerfile.8 .

xcloud: 
	@cd ${IMAGES}/xcloud \
	&& docker build --no-cache -t ${PREFIX}/xcloud:latest .

rsync: 
	@cd ${IMAGES}/rsync \
	&& docker build --no-cache -t ${PREFIX}/rsync:latest .

h5ai: 
	@cd ${IMAGES}/h5ai \
	&& docker build --no-cache -t ${PREFIX}/h5ai:latest .

nextcloud: 
	@cd ${IMAGES}/nextcloud \
	&& docker build --no-cache -t ${PREFIX}/nextcloud:latest .

nginx: 
	@cd ${IMAGES}/nginx \
	&& docker build --no-cache -t ${PREFIX}/nginx:latest .

owncloud: 
	@cd ${IMAGES}/owncloud \
	&& docker build --no-cache -t ${PREFIX}/owncloud:latest .

ttyd:
	@cd ${IMAGES}/ttyd \
	&& docker build --no-cache -t ${PREFIX}/ttyd:latest .

ubuntu:
	@cd ${IMAGES}/ubuntu \
	&& docker build --no-cache -t ${PREFIX}/ubuntu:latest .

ubuntu-cosmic:
	@cd ${IMAGES}/ubuntu \
	&& docker build --no-cache -t ${PREFIX}/ubuntu:cosmic .

ubuntu-bionic:
	@cd ${IMAGES}/ubuntu \
	&& docker build --no-cache -t ${PREFIX}/ubuntu:bionic  --file=Dockerfile.bionic .

ubuntu-xenial:
	@cd ${IMAGES}/ubuntu \
	&& docker build --no-cache -t ${PREFIX}/ubuntu:xenial --file=Dockerfile.xenial .

clean: 
	@echo "Hello World"

help:
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"

.PHONY: clean