FROM nginx:latest
WORKDIR /etc/nginx
COPY ./nginx.conf .
WORKDIR /usr/share/nginx/html
COPY ./html .
RUN apt update && apt install -y nano
