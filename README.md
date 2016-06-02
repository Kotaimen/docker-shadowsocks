Shadowsocks
-----------

Shadowsocks server in a docker container.

Tags:

- `alpine`: Original python version on Alpine Linux 3.3
- `2.4.6` : shadowsocks-libev on ubuntu 14.04
- `2.4.7`, `latest` : shadowsocks-libev on ubuntu 14.04

Enviroment Variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_PORT`: list port, default value is `8388`.
- `SHADOWSOCKS_SCERET`: sceret key, default value is `password`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `10`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `aes-256-cfb`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.
