FROM        debian:jessie
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt-get update && \
            apt-get install -y python-pip git

RUN         set -x \
            && git clone https://github.com/shadowsocks/shadowsocks.git \
            && cd shadowsocks \
            && git checkout feature-ota \
            && python setup.py install

EXPOSE      80
ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
