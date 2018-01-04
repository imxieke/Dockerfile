IMAGES:="images"
# Push to DaoCloud Registry
PREFIX:="daocloud.io/xiekers"
# PREFIX:="imxieke"
# Push to Docker Offcial Registry
phony: 
	@echo "Phony"

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

php: 
	@cd ${IMAGES}/php \
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
	@cd ${IMAGES}/nextCloud \
	&& docker build --no-cache -t ${PREFIX}/nextcloud:latest .

ttyd:
	@cd ${IMAGES}/ttyd \
	&& docker build --no-cache -t ${PREFIX}/ttyd:latest .

clean: 
	@echo "Hello World"

help:
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"

.PHONY: clean