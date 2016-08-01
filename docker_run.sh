#!/usr/bin/env bash

set -e

exec ss-server \
    -u \
    -p ${SHADOWSOCKS_PORT:-8388} \
    -t ${SHADOWSOCKS_TIMEOUT:-10} \
    -m ${SHADOWSOCKS_ENCRYPTIONMETHOD:-aes-256-cfb} \
    -n ${SHADOWSOCKS_MAXOPENFILES:-1024} \
    -k ${SHADOWSOCKS_SECRET}
