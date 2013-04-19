#!/bin/sh

active_nodes="$(ssh wbm-mgmt "cat /tmp/dhcp.leases |grep wbm- | cut -d ' ' -f 4" | tr '\n' ' ')"
[ -z "$active_nodes" ] && exit 1 ;

ruci pull $(for node in $active_nodes ; do printf -- " -i $node $node" ; done)
