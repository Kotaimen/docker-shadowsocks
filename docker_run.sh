#!/usr/bin/env bash

set -e

SHADOWSOCKS_SCERET=${SHADOWSOCKS_SECRET:-gfw}
SHADOWSOCKS_WORKERS=${SHADOWSOCKS_WORKERS:-1}

exec ssserver -s 0.0.0.0 -p 80-m aes-256-cfb -t 300 --fast-open -k $SHADOWSOCKS_SECRET --workers $SHADOWSOCKS_WORKERS

