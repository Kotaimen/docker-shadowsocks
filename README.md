Shadowsocks
-----------

Tags:

- `2.6.2`

By default, UDP relay, simple-obfs and OTA is enabled.

Environment Variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_PORT`: list port, default value is `8388`.
- `SHADOWSOCKS_SCERET`: secret key, default value is `password`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `300`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `chacha20`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.

