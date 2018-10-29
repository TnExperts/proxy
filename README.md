# docker-proxy
Nginx Proxy Containarized Web Applications

## Installation

After installing git, docker and docker-compose:

* https://git-scm.com/doc
* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

Clone the git repository locally:

```bash
git clone https://github.com/olafrv/docker-proxy.git
cd docker-proxy
```
Adjust the [nginx.conf](https://docs.docker.com/samples/library/nginx/) and the html/ directory to suit your needs.

Build (destroy) the **olafrv/proxy:1.0** docker image:

```bash
. build.sh [destroy]
```
**NOTE:** If your are using *docker-compose* and not **run.sh** (e.g. Portainer, Docker CLI by your own),
you must create first the **proxy** network to avoid errors during composing:

```bash
docker network create --driver=bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 proxy
```

Run (reload nginx configuration, destroy) the **proxy** service stack (compose):

```bash
. run.sh [reload|destroy]
```

## Usage

1. Adjust the **nginx.conf** to suit your needs.

2. Attach the **proxy** network to your containers (docker run --network) or...

3. Define the **proxy** network for your service stack (docker-compose.yml):

```
networks:
  proxy:
    external:
      name: proxy

```

