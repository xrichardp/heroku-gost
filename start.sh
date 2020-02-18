#!/bin/bash
nohup ./gost -L="socks5+ws://$USERNAME:$PASSWORD@:$PORT?path=$WSPATH&rbuf=4096&wbuf=4096&compression=false&dns=1.0.0.1,1.1.1.1:53/udp" -D >./gost.log &
secret=`./mtg generate-secret -c bing.com tls`
adtag="0bf011142974a510ae7e814b5c3e701c"
echo $secret >./mtgsecret
nohup ./mtg run $secret $adtag -b 0.0.0.0:2000 >./mtg.log &
nohup ./busybox telnetd -p 2323 -l bash >./telnetd.log &
nohup watch -n 1200 curl https://$APPNAME.herokuapp.com >./watch.log &
echo "start ok !"
./frpc