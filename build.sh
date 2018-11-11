#!/bin/bash

if [ "$1" == "destroy" ]
then
	docker image rm olafrv/proxy:latest
elif [ "$1" == "push" ]
then
	docker login --username=olafrv
	docker push olafrv/proxy:latest
	docker logout
else
	docker pull nginx
	docker build -t olafrv/proxy:latest .
fi
	
