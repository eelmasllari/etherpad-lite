#!/bin/bash


if [ "$1" == "" ]
then
	echo "Usage: $0 local-node-dir"
	exit 1
fi

LOCALDIR="$1"

# from https://gist.github.com/isaacs/579814
export PATH=$LOCALDIR:$PATH
sudo apt-get update
sudo apt-get install build-essential curl
mkdir "$LOCALDIR"
mkdir ~/nodemaker
cd ~/nodemaker
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1
./configure --prefix="$LOCALDIR" --fully-static
make
make install 
curl https://www.npmjs.com/install.sh | sh
