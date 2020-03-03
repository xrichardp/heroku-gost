FROM alpine:3.11

ENV APPNAME=wschatserver TELEGRAM_APITOKEN=1050747418:AAH3uCRuLys5Oz0eLhZN1edGa75zfMSifJ0 USERNAME=gost PASSWORD=gost PORT=8080 WSPATH=/wschat

RUN cd /root \
  && apk update \
  && apk add --no-cache curl wget nano vim sudo busybox git bash clang tar zip unzip libcap \
  && mkdir /root/gost \
  && chmod 0777 /root/gost

ADD zip.zip /root/gost/zip.zip
RUN unzip -d /root/gost/ /root/gost/zip.zip
RUN rm -rf /root/gost/zip.zip
RUN chmod -R 0777 /root/gost && chmod 6777 /bin/su
WORKDIR /root/gost
EXPOSE $PORT
CMD /root/gost/start.sh