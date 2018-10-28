# docker-proxy
Nginx Proxy Containarized Web Applications

## Installation

```bash
git clone https://github.com/olafrv/docker-proxy.git
cd docker-proxy
```
Adjust the [nginx.conf](https://docs.docker.com/samples/library/nginx/) and the html/ directory to suit your needs.

Build the **olafrv/proxy:1.0** docker image:

```bash
. build.sh
```

Deploy the **proxy** service stack (compose):

```bash
. run.sh
```

## Usage

  * Adjust the **nginx.conf** to suit your needs.
  * Attach or defined the **proxy** network to your containers (docker) or services (docker-compose).
