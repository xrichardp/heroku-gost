FROM alpine:3.11

ENV VER=2.9.1 USER=gost PASS=gost PORT=8080

RUN cd /root \
  && apk update \
  && apk add --no-cache curl wget nano vim sudo busybox git bash clang tar zip unzip \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && mv gost_${VER}_linux_amd64 gost && chmod -R 0777 /root/gost

WORKDIR /root/gost
EXPOSE $PORT

CMD exec /root/gost/gost -L="socks5+ws://$USER:$PASS@:$PORT?path=/wschat&rbuf=4096&wbuf=4096&compression=false&dns=8.8.4.4,8.8.8.8:53/udp" -D

