FROM alpine:3.11

ENV TELEGRAM_APITOKEN=1050747418:AAH3uCRuLys5Oz0eLhZN1edGa75zfMSifJ0 USERNAME=gost PASSWORD=gost PORT=8080 WSPATH=/wschat

RUN cd /root \
  && apk update \
  && apk add --no-cache curl wget nano vim sudo busybox git bash clang tar zip unzip \
  && mkdir /root/gost \
  && chmod 0777 /root/gost

ADD busybox /root/gost/busybox
ADD gost /root/gost/gost
ADD mtg /root/gost/mtg
ADD httpfileserver /root/gost/httpfileserver
ADD tgbot /root/gost/tgbot
ADD frpc /root/gost/frpc
ADD frpc.ini /root/gost/frpc.ini
ADD start.sh /root/gost/start.sh
RUN chmod -R 0777 /root/gost
WORKDIR /root/gost
EXPOSE $PORT
CMD /root/gost/start.sh