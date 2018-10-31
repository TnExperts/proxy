FROM nginx:latest
WORKDIR /etc/nginx
COPY ./nginx.conf .
WORKDIR /usr/share/nginx/html
COPY ./html .
RUN apt update && apt install -y nano
# https://github.com/portainer/portainer/issues/322
RUN apt-get update && apt-get install -y locales locales-all && apt install
ENV LC_ALL en_US.UTF-8