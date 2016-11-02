Shadowsocks
-----------

Shadowsocks server in a docker container.

Tags:

- `2.5.6`, `latest` : `shadowsocks-libev-2.5.6` on `debian:jessie`
- `2.5.5` : `shadowsocks-libev-2.5.6` on `debian:jessie`
- `2.5.4` : `shadowsocks-libev-2.5.4` on `debian:jessie`
- `2.5.3` : `shadowsocks-libev-2.5.3` on `debian:jessie`
- `2.5.2` : `shadowsocks-libev-2.5.2` on `debian:jessie`
- `2.4.8` : `shadowsocks-libev-2.4.8` on `debian:jessie`


Environment Variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_PORT`: list port, default value is `8388`.
- `SHADOWSOCKS_SCERET`: secret key, default value is `password`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `10`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `aes-256-cfb`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.
