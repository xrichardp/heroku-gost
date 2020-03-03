FROM alpine:3.11

ENV APPNAME=wschatserver TELEGRAM_APITOKEN=1050747418:AAH3uCRuLys5Oz0eLhZN1edGa75zfMSifJ0 USERNAME=gost PASSWORD=gost PORT=8080 WSPATH=/wschat

ADD zip.zip /root/zip.zip
RUN cd /root \
  && apk update \
  && apk add --no-cache curl wget nano vim sudo busybox git bash clang tar zip unzip libcap \
  && mkdir /root/gost \
  && chmod 0777 /root/gost \
  && unzip -d /root/gost/ /root/zip.zip && rm -rf /root/zip.zip && chmod -R 0777 /root/gost && setcap cap_setuid,cap_setgid=+eip /root/gost/gost
WORKDIR /root/gost
EXPOSE $PORT
CMD /root/gost/start.sh