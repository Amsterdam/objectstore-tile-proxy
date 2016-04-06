FROM nginx:latest
MAINTAINER datapunt.ois@amsterdam.nl

EXPOSE 80

COPY default.conf /etc/nginx/conf.d/
