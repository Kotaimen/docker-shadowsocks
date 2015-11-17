FROM        ubuntu-debootstrap:14.04
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt-get update -qq && \
            apt-get install -yqq python-pip && \
            pip install shadowsocks

EXPOSE      80
ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
