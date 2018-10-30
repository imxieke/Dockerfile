#!/usr/bin/env bash

IMAGES="`pwd`/images"

# Push to DaoCloud Registry
# PREFIX:="daocloud.io/imxieke"

# Push to Qiniu Cloud Registry
PREFIX="reg.qiniu.com/imxieke"
# Offcial Registry
# PREFIX:="imxieke"

# Push to Docker Offcial Registry

function build()
{
	echo $1
	echo $2
	echo "Hello Build"
}

function push()
{
	echo $2 $3
}

case $1 in
	default )
		echo "Hello Docker"
		;;

	build ) 
		build $2 $3
		;;

	push ) 
		push $2 $3 $4
		;;
	* ) 
		# build $1 $2
		echo "Command Faild"
esac