#!/usr/bin/env sh

set -e

exec ss-server -v \
    -s ${SHADOWSOCKS_HOST} \
    -p ${SHADOWSOCKS_PORT} \
    -k ${SHADOWSOCKS_PASSWORD} \
    -t ${SHADOWSOCKS_TIMEOUT} \
    -m ${SHADOWSOCKS_ENCRYPTIONMETHOD} \
    -n ${SHADOWSOCKS_MAXOPENFILES} \
    --fast-open -u -A \
    --plugin obfs-server --plugin-opts obfs=http
