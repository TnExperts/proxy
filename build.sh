#!/bin/bash

if [ "$1" == "destroy" ]
then
	docker image rm olafrv/proxy:lastest
else
	docker pull nginx
	docker build -t olafrv/proxy:lastest .
fi
	
