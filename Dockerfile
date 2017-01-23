FROM        alpine:3.5
MAINTAINER  KOTAIMEN <kotaimen.c@gmail.com>

ARG         SS_VER=2.6.2
ARG         SS_URL=https://github.com/shadowsocks/shadowsocks-libev/archive/v${SS_VER}.tar.gz
ARG         OBFS_VER=0.0.2
ARG         OBFS_URL=https://github.com/shadowsocks/simple-obfs/archive/v${OBFS_VER}.tar.gz

ENV         SHADOWSOCKS_HOST 0.0.0.0
ENV         SHADOWSOCKS_PORT 8388
ENV         SHADOWSOCKS_PASSWORD bob180180180
ENV         SHADOWSOCKS_TIMEOUT 300
ENV         SHADOWSOCKS_ENCRYPTIONMETHOD chacha20
ENV         SHADOWSOCKS_MAXOPENFILES 1000

RUN set -ex \
    && apk add --no-cache \
        --virtual .build-deps \
        asciidoc \
        autoconf \
        build-base \
        curl \
        libtool \
        linux-headers \
        openssl-dev \
        pcre-dev \
        tar \
        xmlto \
    \
    && mkdir -p /tmp/ss /tmp/obfs \
    \
    && cd /tmp/ss \
    && curl -sSL $SS_URL | tar xz --strip 1 \
    && ./configure --prefix=/usr --disable-documentation \
    && make install \
    \
    && cd /tmp/obfs \
    && curl -sSL $OBFS_URL | tar xz --strip 1 \
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

EXPOSE      ${SHADOWSOCKS_PORT}/tcp ${SHADOWSOCKS_PORT}/udp

ADD         docker_run.sh ./
CMD         ["./docker_run.sh"]
