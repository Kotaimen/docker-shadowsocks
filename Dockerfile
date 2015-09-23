FROM        ubuntu:14.04
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt-get update && \
            apt-get install -y python-pip && \
            pip install shadowsocks

WORKDIR     /etc/shadowsocks/

EXPOSE      80
ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
