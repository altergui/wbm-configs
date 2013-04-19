#!/bin/sh

if [ -z $3 ]; then
	echo "usage: " $0 " <router id> <interval> <count>"
	exit 1;
fi

routerid="$1"
interval="$2"
count="$3"

pingypongy () {
	ping6 -i $interval -c $count $1
}

pingypongy fdbb::${routerid}
pingypongy fdba:11:${routerid}::1
pingypongy fdba:12:${routerid}::1
pingypongy fdba:14:${routerid}::1


