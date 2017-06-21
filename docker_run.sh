#!/usr/bin/env sh

set -e

exec ss-server -v \
    -s ${SHADOWSOCKS_HOST:-0.0.0.0} \
    -p ${SHADOWSOCKS_PORT:-8388} \
    -k ${SHADOWSOCKS_SCERET:-bob180180180} \
    -t ${SHADOWSOCKS_TIMEOUT:-300} \
    -m ${SHADOWSOCKS_ENCRYPTIONMETHOD:-chacha20} \
    -n ${SHADOWSOCKS_MAXOPENFILES:-1000} \
    --fast-open -u \
    --plugin obfs-server --plugin-opts obfs=${SIMPLE_OBFS_METHOD:http}
