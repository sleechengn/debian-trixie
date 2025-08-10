#!/usr/bin/bash

if [ -e "$(dirname $0)/Dockerfile.run.build" ]; then
	IMAGE_TAG=$1
	if [ $IMAGE_TAG ]; then
                docker build $(dirname $0) --file Dockerfile.run.build -t $IMAGE_TAG
        else
                docker --debug build $(dirname $0) --file Dockerfile.run.build -t sleechengn/debian:trixie
	fi
else
	IMAGE_TAG=$1
	if [ $IMAGE_TAG ]; then
                docker build $(dirname $0) --file Dockerfile -t $IMAGE_TAG
        else
                docker --debug build $(dirname $0) --file Dockerfile -t sleechengn/ubuntu:trixie
	fi
fi
