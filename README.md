# Shadowsocks

Shadowsocks on alpine linux with simple http obfuscating , built from source.

Tags:

- `3.0.6`, `latest`: shadowsocks-libev with simple-obfs plugin on alpine 3.6
- `2.6.2`: shadowsocks-libev with simple-obfs plugin on alpine 3.5

> Note: OTA is not available in `3.x` tags.


## Usage

By default, image starts in server mode, which can be customized using
environment variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_SCERET`: secret key, default value is `bob180180180`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `300`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `chacha20`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.

Start server with:

    docker run \
        -P 0.0.0.0:8388:8388 \
        -e SHADOWSOCKS_SCERET=password \
        -e SHADOWSOCKS_ENCRYPTIONMETHOD=aes-256-cfb \
        kotaimen/shadowsocks
    
Start client with:

    docker run \
        -P 0.0.0.0:1080:1080 \
        --entrypoint ss-local \
        kotaimen/shadowsocks \
        -s hostname \
        -p 8388 \
        -k password \
        -m aes-256-cfb \
        -b 0.0.0.0 -l 1080 -u \
        --plugin-opts "obfs=http;obfs-host=hostname"

