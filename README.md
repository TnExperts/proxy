# olafrv/proxy
Nginx Proxy Containarized Web Applications

 * Source: https://github.com/olafrv/proxy
 * Images: 
   * https://hub.docker.com/r/olafrv/proxy
   * https://docs.docker.com/samples/library/nginx/
 * Certbot (Let's Encrypt):
   * https://certbot.eff.org/lets-encrypt/debianstretch-other

## Installation

After installing git, docker and docker-compose:

* https://git-scm.com/doc
* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

Clone the git repository locally:

```bash
mkdir -p /var/lib/docker-compose
cd /var/lib/docker-compose
git clone https://github.com/olafrv/proxy.git
cd proxy
```

## Configuration

Please see Docker Network documentation to integrate other containers with the proxy:

* docker: https://docs.docker.com/compose/networking/
* docker-compose: https://docs.docker.com/engine/reference/run/#network-settings

**REMEMBER:** If your are using *docker-compose* each container's name is a DNS record
if you are using a used defined network (not the default bridge), so any container can
access each other using their names.

If your are using *docker-compose* instead of **proxy.sh up** (e.g. Portainer, Docker CLI 
by your own), you must create a user defined network, here is named **composed** network
to avoid errors during composing:

```bash
docker network create --driver=bridge --subnet=172.29.4.0/24 --gateway=172.29.4.1 composed
```
1. Adjust the [**nginx.conf**](https://www.nginx.com/resources/wiki/start/topics/examples/full/)
and the html/ directory to suit your needs. 

2. Create the the **nginx-app.conf** and add your application relative URL (e.g. /app):

```
###
# APP LOCATION -> CONTAINER (PROXIED)
# Help: https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/
##
location /app {
	# NGINX IP ADDRESS SEEN BY USERS 
	# IN THE BROWSER (FRONTEND)
	proxy_set_header Host $server_name;
	# APPLICATION CONTAINER (BACKEND)
	# *** ONLY WORKS WHEN USING DOCKER-COMPOSE
	# *** TO CREATE THE app_container CONTAINER
	# *** BECAUSE limesurvey_web SHOULD BE CREATED
	# *** AS INTERNAL DNS RECORD AT DOCKER LEVEL
	proxy_pass http://app_container/; 
}
```

3. Attach the **composed** network to your containers (docker run --network) or...

4. Define the **composed** network for your service stack (docker-compose.yml):

```
networks:
  composed:
    external:
      name: composed

```

## Run

### Basics

Run (reload nginx configuration, compose up/down) the **proxy** service stack:

```bash
. proxy.sh [reload|up|down]
```

### SSL Certificates

Generate/Renew SSL certificate using Let's Encrypt (Certbot script). A cronjob
is created in the Docker host (not inside the proxy container) to auto renew the 
proxy SSL certificate:

```bash
. proxy.sh [newssl|renewssl]
```

## Build (Manually)

Build (destroy) the **olafrv/proxy:latest** docker image using one of the following commands:

```bash
# docker
. build.sh [destroy]
# docker-compose
docker-compose build
```

## Backup

You must fully backup the **/var/lib/docker-compose/proxy** directory.
