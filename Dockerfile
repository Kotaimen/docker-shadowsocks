FROM        alpine:3.6
MAINTAINER  KOTAIMEN <kotaimen.c@gmail.com>

ARG         SS_VER=3.0.7
ARG         SS_URL=https://github.com/shadowsocks/shadowsocks-libev/releases/download/v3.0.6/shadowsocks-libev-${SS_VER}.tar.gz
#ARG         OBFS_VER=0.0.3
ARG         OBFS_URL=https://github.com/shadowsocks/simple-obfs.git

ENV         SS_PORT=8388

RUN         set -ex \
            && apk add --no-cache \
                --virtual .build-deps \
                autoconf \
                automake \
                build-base \
                curl \
                libev-dev \
                libtool \
                linux-headers \
                udns-dev \
                libsodium-dev \
                mbedtls-dev \
                pcre-dev \
                tar \
                git \
            \
            && mkdir -p /tmp/ss \
            && cd /tmp/ss \
            && curl -sSL $SS_URL | tar xz --strip 1 \
            && ./configure --prefix=/usr --disable-documentation \
            && make install \
            \
            && cd /tmp/ \
            && git clone $OBFS_URL simple-obfs \
            && cd simple-obfs \
            && git submodule update --init --recursive \
            && ./autogen.sh \
            && ./configure --prefix=/usr --disable-documentation \
            && make install \
            \
            && runDeps="$( \
                scanelf --needed --nobanner /usr/bin/ss-* /usr/bin/obfs-* \
                    | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
                    | xargs -r apk info --installed \
                    | sort -u \
            )" \
            && apk add --no-cache --virtual .run-deps $runDeps \
            \
            && apk del .build-deps \
            && cd / && rm -rf /tmp/*

USER        nobody

EXPOSE      ${SS_PORT}/tcp ${SS_PORT}/udp

# Start in server mode by default
ADD         docker_run.sh ./
CMD         ["./docker_run.sh"]
