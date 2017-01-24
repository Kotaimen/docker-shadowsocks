Shadowsocks
-----------

Tags:

- `2.6.2`, `latest` : shadowsocks-libev with obfs plugin on alpine 5.3

Simple http obfuscating and onetime authentication is enabled by default.

Environment Variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_PORT`: list port, default value is `8388`.
- `SHADOWSOCKS_SCERET`: secret key, default value is `bob180180180`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `300`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `rc4-md5`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.
