#!/usr/bin/env bash

set -e

SHADOWSOCKS_SCERET=${SHADOWSOCKS_SCERET:-gfw}

cat >> /etc/shadowsocks/shadowsocks.json << EOF
{
    "server":"0.0.0.0",
    "server_port": 80,
    "local_address": "0.0.0.0",
    "local_port": 1081,
    "password":"$SHADOWSOCKS_SCERET",
    "timeout":200,
    "method":"aes-256-cfb"
}

EOF

exec ssserver -c /etc/shadowsocks/shadowsocks.json

