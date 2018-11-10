mkdir -p letsencrypt/{etc,lib,log}
docker exec -it proxy /usr/bin/certbot certonly -n --agree-tos --webroot \
	-w /usr/share/nginx/html -d app.daycohost.com -m soporteinterno@daycohost.com

