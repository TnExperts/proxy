FROM nginx:latest
WORKDIR /etc/nginx
COPY ./nginx.conf .
WORKDIR /usr/share/nginx/html
COPY ./html .
