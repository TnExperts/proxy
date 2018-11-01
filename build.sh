#!/bin/bash

if [ "$1" == "destroy" ]
then
	docker image rm olafrv/proxy:latest
else
	docker pull nginx
	docker build -t olafrv/proxy:latest .
fi
	
