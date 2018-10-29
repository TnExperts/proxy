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

Run (reload nginx configuration, destroy) the **proxy** service stack (compose):

```bash
. run.sh [reload|destroy]
```

## Usage

  * Adjust the **nginx.conf** to suit your needs.
  * Attach or defined the **proxy** network to your containers (docker) or services (docker-compose).
