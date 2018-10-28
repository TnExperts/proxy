#!/bin/bash

if [ "$1" == "reload" ]
then
	docker container exec proxy nginx -t \
		&& docker container exec proxy nginx -s reload
elif [ "$1" == "destroy" ]
then 
	docker stop proxy
	docker rm proxy
	docker network rm proxy || docker network inspect proxy
else
	if ! docker network ls | grep proxy
	then
		docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 proxy
	fi
	docker-compose up -d
fi

