all: # include all command (Function)

	@echo "Test Docker"

# add @ don't will output command
# = base value 
# := will overwrite value

runphp7:
	docker run -d --name="php7" --hostname="php7" -v /home/imxieke/WorkSpaces/Volumes/php:/var/www -p 10080:80 imxieke/php7

runmariadb:
	docker run -d --name mariadb --hostname mariadb -v /home/imxieke/WorkSpaces/Volumes/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=19960318 -p 13306:3306 mariadb:10.3.2

phony: 
	@echo "Phony"

clean: 
	rm -fr $(OBJ)

cmd: 
	@echo $1 

help:
	@echo "usage: output clean cmd help"

.PHONY: clean