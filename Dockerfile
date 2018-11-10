# https://hub.docker.com/_/nginx/
FROM nginx:1.15.6
WORKDIR /etc/nginx
COPY ./nginx.conf .
WORKDIR /usr/share/nginx/html
COPY ./html .
# https://certbot.eff.org/lets-encrypt/debianstretch-other
# https://backports.debian.org/Instructions/
RUN true && \
    echo "deb http://ftp.debian.org/debian stretch-backports main" >> "/etc/apt/sources.list.d/backports.list" && \
    apt-get -y update && \
    apt-get -y install certbot -t stretch-backports && \
    apt-get -y autoremove && \
    apt-get -y clean
