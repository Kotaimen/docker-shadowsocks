FROM        ubuntu:trusty
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

ENV         DEBIAN_FRONTEND noninteractive

ENV         SHADOWSOCKS_VERSION 2.4.6
ENV         DEV_PACKAGES git-core build-essential autoconf libtool libssl-dev

WORKDIR     /build

RUN         set -x \
            && apt-get -q update \
            && apt-get -yq install \
                ${DEV_PACKAGES} \
                curl \
            && curl -sSL https://github.com/shadowsocks/shadowsocks-libev/archive/v${SHADOWSOCKS_VERSION}.tar.gz | tar xfz - \
            && cd shadowsocks-libev-${SHADOWSOCKS_VERSION} \
            && ./configure \
            && make && make install \
            && cd && rm -rf ${WORKDIR} \
            && apt-get -yq remove ${DEV_PACKAGES} \
            && apt-get -yq autoremove \
            && rm -rf /var/lib/apt/lists/*
            
#EXPOSE      80
ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
