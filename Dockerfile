FROM nginx:latest
MAINTAINER datapunt.ois@amsterdam.nl

ARG OS_USER_PASS_ENCODED
ENV OS_USER_PASS_ENCODED=$OS_USER_PASS_ENCODED

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

RUN sed -i "s/__OS_USER_PASS_ENCODED__/$OS_USER_PASS_ENCODED/g" /etc/nginx/conf.d/default.conf