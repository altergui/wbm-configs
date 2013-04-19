#!/bin/sh

rm -f /tmp/survey
for x in $(
	{ wbm-experiment list nodes olsr; wbm-experiment list nodes bmx6; } | \
	cut -d/ -f1 | grep fdba: | cut -d: -f3 | sort -u
); do
	echo "wbm-$(printf "%04x" $((0x$x)) ) $(wget -qO- http://[fdbb::$x]/etc/wbm.version 2>/dev/null)" >> /tmp/survey &
done

