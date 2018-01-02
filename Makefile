IMAGES:="images"

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
	&& docker build --no-cache -t imxieke/alpine:latest .

debian:
	@cd ${IMAGES}/debian \
	&& docker build --no-cache -t imxieke/debian:latest .


golang:
	@cd ${IMAGES}/golang \
	&& docker build --no-cache -t imxieke/golang:latest .

php: 
	@cd ${IMAGES}/php \
	&& docker build --no-cache -t imxieke/php:latest .

xcloud: 
	@cd ${IMAGES}/xcloud \
	&& docker build --no-cache -t imxieke/xcloud:latest .
rsync: 
	@cd ${IMAGES}/rsync \
	&& docker build --no-cache -t imxieke/rsync:latest .
h5ai: 
	@cd ${IMAGES}/h5ai \
	&& docker build --no-cache -t imxieke/h5ai:latest .
nextcloud: 
	@cd ${IMAGES}/nextCloud \
	&& docker build --no-cache -t imxieke/nextcloud:latest .

ttyd:
	@cd ${IMAGES}/ttyd \
	&& docker build --no-cache -t imxieke/ttyd:latest .

clean: 
	@echo "Hello World"

help:
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"
	@echo "usage:		output clean cmd help"

.PHONY: clean 