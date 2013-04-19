#!/bin/ash

printandexec () {
	echo "====================================="
	echo "$@"
	echo "====================================="
	eval "$@"
}

printandexec date
printandexec wbm-experiment top
printandexec killall -SIGUSR1 babeld
printandexec cat /var/log/babeld.log
printandexec killall -SIGUSR2 babeld
printandexec cat /var/log/babeld.log

printandexec date
printandexec wbm-experiment top
printandexec batctl o 

printandexec date
printandexec wbm-experiment top
printandexec wbm-experiment list nodes bmx6
printandexec wbm-experiment list neigh bmx6

printandexec date
printandexec wbm-experiment top
printandexec wget http://[::1]:2006/all -O -

printandexec date
printandexec wbm-experiment top
printandexec ip -6 route show

printandexec date
printandexec wbm-experiment top

printandexec date

