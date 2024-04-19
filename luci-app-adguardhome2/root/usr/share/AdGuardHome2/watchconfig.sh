#!/bin/sh
PATH="/usr/sbin:/usr/bin:/sbin:/bin"
configpath=$(uci get AdGuardHome2.AdGuardHome2.configpath)
while :
do
	sleep 10
	if [ -f "$configpath" ]; then
		/etc/init.d/AdGuardHome2 do_redirect 1
		break
	fi
done
return 0