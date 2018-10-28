#!/bin/bash

if [ "$1" == "destroy" ]
then
	docker image rm daycohost/proxy:1.0
else
	docker pull nginx
	docker build -t daycohost/proxy:1.0 .
fi
	
