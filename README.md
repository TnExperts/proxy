# proxy
Nginx Proxy Containarized Web Applications

## Source Code

Clone from: https://github.com/olafrv/proxy

## Docker Image

Pull from: https://hub.docker.com/r/olafrv/proxy

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
Adjust the [nginx.conf](https://docs.docker.com/samples/library/nginx/) 
and the html/ directory to suit your needs.

Build (destroy) the **olafrv/proxy:latest** docker image:

```bash
. build.sh [destroy]
```

Please see Docker Network documentation to integrate other containers with the proxy:

* docker: https://docs.docker.com/compose/networking/
* docker-compose: https://docs.docker.com/engine/reference/run/#network-settings

**REMEMBER:** If your are using *docker-compose* each container's name is a DNS record, 
so any container can access each other using their names.

If your are using *docker-compose* instead of **proxy.sh up** (e.g. Portainer, Docker CLI 
by your own), you must create first the **proxy** network to avoid errors during composing:

```bash
docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 proxy
```

Run (reload nginx configuration, compose up/down) the **proxy** service stack:

```bash
. proxy.sh [reload|up|down]
```

Generate/Renew SSL certificate using Let's Encrypt (Certbot script). A cronjob
is created in the Docker host (not inside the proxy container) to auto renew the 
proxy SSL certificate:

```bash
. proxy.sh [newssl|renewssl]
```
## Usage

1. Adjust (Uncomment) the **nginx.conf**.
2. Create the the **nginx-app.conf** and add your application relative URL (e.g. /app):

```
###
# APP LOCATION -> CONTAINER (PROXIED)
# Help: https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/
##
location /app {
        proxy_set_header Host $server_name;
        proxy_pass http://app/; 
}
```

3. Attach the **proxy** network to your containers (docker run --network) or...

4. Define the **proxy** network for your service stack (docker-compose.yml):

```
networks:
  proxy:
    external:
      name: proxy

```

