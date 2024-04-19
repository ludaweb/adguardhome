#!/bin/sh
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
logread -e AdGuardHome2 > /tmp/AdGuardHome2tmp.log
logread -e AdGuardHome2 -f >> /tmp/AdGuardHome2tmp.log &
pid=$!
echo "1">/var/run/AdGuardHome2syslog
while true
do
	sleep 12
	watchdog=$(cat /var/run/AdGuardHome2syslog)
	if [ "$watchdog"x == "0"x ]; then
		kill $pid
		rm /tmp/AdGuardHome2tmp.log
		rm /var/run/AdGuardHome2syslog
		exit 0
	else
		echo "0">/var/run/AdGuardHome2syslog
	fi
done