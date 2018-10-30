# proxy
Nginx Proxy Containarized Web Applications

# Source Code

Clone from: https://github.com/olafrv/proxy

# Docker Image

Pull from: https://hub.docker.com/r/olafrv/proxy

## Installation

After installing git, docker and docker-compose:

* https://git-scm.com/doc
* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

Clone the git repository locally:

```bash
git clone https://github.com/olafrv/proxy.git
cd proxy
```
Adjust the [nginx.conf](https://docs.docker.com/samples/library/nginx/) 
and the html/ directory to suit your needs.

Build (destroy) the **olafrv/proxy:1.0** docker image:

```bash
. build.sh [destroy]
```

Please see Docker Network documentation to integrate other containers with the proxy:

* docker: https://docs.docker.com/compose/networking/
* docker-compose: https://docs.docker.com/engine/reference/run/#network-settings


**REMEMBER:** If your are using *docker-compose* each container's name is a DNS record, 
so any container can access each other using their names.

If your are using *docker-compose* and not **run.sh** (e.g. Portainer, Docker CLI by your own),
you must create first the **proxy** network to avoid errors during composing:

```bash
docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 proxy
```

Run (reload nginx configuration, destroy) the **proxy** service stack (compose):

```bash
. run.sh [reload|destroy]
```

## Usage

1. Adjust the **nginx.conf** to proxy your application relative URL (e.g. /app):

```
location /app {
  ...
}
```

2. Attach the **proxy** network to your containers (docker run --network) or...

3. Define the **proxy** network for your service stack (docker-compose.yml):

```
networks:
  proxy:
    external:
      name: proxy

```

