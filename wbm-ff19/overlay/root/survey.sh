#!/bin/sh

rm -f /tmp/survey
for x in $(wbm-experiment list nodes olsr | cut -d/ -f1 | grep fdba:1: | sort -u); do
	echo "$x $(wget -qO- http://[$x]/etc/wbm.version 2>/dev/null)" >> /tmp/survey &
done

