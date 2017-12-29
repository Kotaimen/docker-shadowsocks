# Shadowsocks

Shadowsocks on alpine linux with simple http obfuscating , built from source.

Tags:

- `3.1.2`, `latest`: shadowsocks-libev with simple-obfs plugin on alpine 3.7
- `3.1.2` : shadowsocks-libev with simple-obfs plugin on alpine 3.6
- `2.6.2`: shadowsocks-libev with simple-obfs plugin on alpine 3.5

> Note: OTA is not available on 3.x, use gcm encryption methods instead. 

## Usage

By default, image starts in server mode, which can be customized using
environment variables (see shadowsocks-libev man page for more information):

- `SHADOWSOCKS_SCERET`: secret key, default value is `bob180180180`.
- `SHADOWSOCKS_ENCRYPTIONMETHOD`: encryption method, default value is `chacha20`.
- `SHADOWSOCKS_TIMEOUT`: socket timeout in seconds, default value is `300`.
- `SHADOWSOCKS_MAXOPENFILES`: max open files, default value is `1000`.
- `SIMPLE_OBFS_METHOD`: simple obfuscation method, default value is `http`

Start server with:

    docker run \
        -p 0.0.0.0:8388:8388 \
        -e SHADOWSOCKS_SCERET=bob \
        -e SHADOWSOCKS_ENCRYPTIONMETHOD=aes-256-gcm \
        kotaimen/shadowsocks
    
Start client with:

    docker run \
        -p 0.0.0.0:1080:1080 \
        kotaimen/shadowsocks \
        ss-local \
          -s bob.net \
          -p 80 \
          -b 0.0.0.0 \
          -l 1080 \
          -k password \
          -u -m aes-256-gcm \
          --plugin obfs-local \
          --plugin-opts "obfs=http;obfs-host=bob.net"

