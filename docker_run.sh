#!/usr/bin/env bash

set -e

SHADOWSOCKS_SCERET=${SHADOWSOCKS_SCERET:-gfw}
SHADOWSOCKS_WORKERS=${SHADOWSOCKS_WORKERS:-1}

exec ssserver -s 0.0.0.0 -p 80 -k $SHADOWSOCKS_SCERET -t 300 -m aes-256-cfb --fast-open --workers $SHADOWSOCKS_WORKERS

