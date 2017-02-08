FROM nginx:latest
MAINTAINER datapunt.ois@amsterdam.nl

ARG OS_PASS_BOMMENKAART
ENV OS_PASS_BOMMENKAART=$OS_PASS_BOMMENKAART

ARG OS_USER_BOMMENKAART
ENV OS_USER_BOMMENKAART=$OS_USER_BOMMENKAART


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

RUN sed -i "s/__OS_PASS_BOMMENKAART__/$OS_PASS_BOMMENKAART/g" /etc/nginx/conf.d/default.conf