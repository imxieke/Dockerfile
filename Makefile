all: # include all command (Function)

	@echo "Test Docker"

# add @ don't will output command
# = base value 
# := will overwrite value

runphp7:
	docker run -d --rm --name="php7" --hostname="php7" -p 10080:80 imxieke/php7

phony: 
	@echo "Phony"

clean: 
	rm -fr $(OBJ)

cmd: 
	@echo $1 

help:
	@echo "usage: output clean cmd help"

.PHONY: clean