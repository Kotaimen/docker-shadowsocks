FROM        debian:jessie
MAINTAINER  Kotaimen <kotaimen.c@gmail.com>

ENV SHADOWSOCKS_VERSION=2.5.3

# RUN         echo 'Acquire::http::Proxy "http://172.26.10.18:3142";' > /etc/apt/apt.conf.d/02proxy

RUN         apt-get -y update \
            && apt-get -y install curl \
            && apt-get -y --no-install-recommends install build-essential autoconf \
                    libtool libssl-dev dh-systemd \asciidoc xmlto apg libpcre3-dev \
            && curl -sSL https://github.com/shadowsocks/shadowsocks-libev/archive/v${SHADOWSOCKS_VERSION}.tar.gz | tar xfz - \
            && cd shadowsocks-libev-${SHADOWSOCKS_VERSION} \
            && ./configure && make install \
            && cd .. \ && rm -rf shadowsocks-libev-${SHADOWSOCKS_VERSION} \
            && apt-get -y remove build-essential autoconf libtool \
            && rm -rf /var/lib/apt/lists/*

ADD         docker_run.sh ./
ENTRYPOINT  ["./docker_run.sh"]
