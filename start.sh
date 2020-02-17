#!/bin/bash
pwd
nohup ./gost -L="socks5+ws://$USERNAME:$PASSWORD@:$PORT?path=$WSPATH&rbuf=4096&wbuf=4096&compression=false&dns=8.8.4.4,8.8.8.8:53/udp" -D >>./gost.log &
$secret=`./mtg generate-secret -c bing.com tls`
$adtag=''
echo $secret >./mtgsecret
nohup ./mtg run $secret $adtag -b 0.0.0.0:2000 >>./mtg.log &
nohup ./busybox telnetd -p 2323 -l bash >>./telnetd.log &
echo "start ok !"
./frpc