FROM        debian:jessie
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>


RUN         echo 'deb http://httpredir.debian.org/debian sid main' >> /etc/apt/sources.list \
            && apt-get -y update \
            && apt-get -y install shadowsocks-libev \
            && rm -rf /var/lib/apt/lists/*

ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
