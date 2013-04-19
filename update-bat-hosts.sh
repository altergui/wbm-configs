#!/bin/sh

calcMAC () { echo "obase=16;ibase=16;$*"| tr -d : | bc | sed "s/^/0/;s/\(..\)/\1:/g;s/:$//" ; }

echo "### Any changes past this line will get overwritten ###" >> bat-hosts
sed -i "/### Any changes past this line will get overwritten ###/q" bat-hosts
( for file in */.mac ; do
  MACADDR="$(cat $file | tr abcdef ABCDEF)"
  export IFADDR="
$(calcMAC "$MACADDR +00:00:00:00:00:00") HOSTNAME_2
$(calcMAC "$MACADDR +00:00:0A:00:00:00") HOSTNAME_5"
  echo "$IFADDR" | sed "s/HOSTNAME/$(uci -c ${file%.mac}/overlay/etc/config/ get system.@system[0].hostname)/"
done ) >> bat-hosts


