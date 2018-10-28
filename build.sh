#!/bin/bash

if [ "$1" == "destroy" ]
then
	docker image rm olafrv/docker-proxy:1.0
else
	docker pull nginx
	docker build -t olafrv/docker-proxy:1.0 .
fi
	
