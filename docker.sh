#!/usr/bin/env bash
# Author: Cloudflying
# Desc:   Push to Docker Registry

IMG_DIR="`pwd`/images"

# Push to DaoCloud Registry
# PREFIX:="daocloud.io/imxieke"

# Push to Qiniu Cloud Registry
# PREFIX="reg.qiniu.com/imxieke"
# Offcial Registry
PREFIX="imxieke"

function build()
{
	if [[ ! -d "$IMG_DIR/$2" ]]; then
		echo "Catelog $2 or Dockerfile Not Exist"
		exit 1
	fi
	cd "$IMG_DIR/$2"
	if [[ $3 != '' ]]; then
		if [[ $3 == 'latest' ]]; then	
			docker $1 --no-cache -t ${PREFIX}/$2:latest .
		else
			docker $1 --no-cache -t ${PREFIX}/$2:$3 --file=Dockerfile.$3 .
		fi
	else
		docker $1 --no-cache -t ${PREFIX}/$2:latest .
	fi
}

function push()
{
	# echo $1 $2 $3 $4 $5 $6

	if [[ $3 != '' ]]; then

		if [[ $3 == 'latest' ]]; then
			docker push ${PREFIX}/$2:latest
		else
			docker push ${PREFIX}/$2:$3
		fi

	elif [[ $3 == '' ]]; then
		docker push ${PREFIX}/$2:latest
	fi

}

function usage()
{
	echo "	Docker Build Tool
/-----------------------------------\\
|	build image name tag         |
|	push  image name tag         |
\\-----------------------------------/
"
}

case $1 in
	build ) 
		build $1 $2 $3 $4 $5 $6
		;;

	push ) 
		push $1 $2 $3 $4 $5 $6
		;;

	* ) 
		# echo "Command Faild"
		usage
esac