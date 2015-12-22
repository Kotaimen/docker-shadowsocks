FROM        alpine
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

RUN         set -x  \
            && apk update \
            && apk add -U python curl bash \
            && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
            && pip install shadowsocks \
            && rm -rf /var/cache/apk/*
            
EXPOSE      80
ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
