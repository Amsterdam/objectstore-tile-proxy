FROM nginx:latest
MAINTAINER datapunt.ois@amsterdam.nl

EXPOSE 80

RUN apt-get update \
    && apt-get install -y \
            curl \
            netcat-openbsd \
    && apt-get clean \
    && rm -rf /var/cache/apt

COPY default.conf /etc/nginx/conf.d/
COPY health.txt /srv/www/health/index.html
COPY .jenkins/run_tests.sh /usr/local/bin/
