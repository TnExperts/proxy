#!/bin/bash

WORKDIR=/var/lib/docker-compose/proxy
SSL_EMAIL=soporteinterno@daycohost.com
SSL_DOMAIN=app.daycohost.com

cd $WORKDIR || exit 1

function proxy_reload
{
#	docker container exec proxy nginx -t \
#		&& docker container exec proxy nginx -s reload
	docker restart proxy
}

if [ "$1" == "reload" ]
then

	proxy_reload

elif [ "$1" == "down" ]
then 
#	docker stop proxy
#	docker rm proxy
#	docker network rm proxy || docker network inspect proxy
	docker-compose down

elif [ "$1" == "up" ]
then

#	if ! docker network ls | grep proxy
#	then
#		docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 proxy
#	fi
	docker-compose up -d

elif [ "$1" == "newssl" ]
then
	mkdir -p letsencrypt/{etc,lib,log}
	docker exec -it proxy /usr/bin/certbot certonly -n --agree-tos --webroot \
		-w /usr/share/nginx/html -d $SSL_DOMAIN -m $SSL_EMAIL
	proxy_reload

elif [ "$1" == "renewssl" ]
then

cat - > /etc/cron.d/proxy-certificates <<END
23 5 * * * root /bin/bash $WORKDIR/letsencrypt.sh renewssl
END
	docker container exec proxy /usr/bin/certbot renew
	proxy_reload

fi

