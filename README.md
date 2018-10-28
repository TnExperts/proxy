# docker-proxy
Nginx Proxy Containarized Web Applications

## Installation

```
git clone https://github.com/olafrv/docker-proxy.git
cd docker-proxy
```
Adjust the *nginx.conf* and the html/ directory to suit your needs.

Build the *daycohost/proxy:1.0* docker image:
```
. build.sh
```

Deploy the *proxy* service stack (compose):
```
. run.sh
```

## Usage

  * Adjust the *nginx.conf* to suit your needs.
  * Attach or defined the *proxy* network to your containers (docker) or services (docker-compose).
