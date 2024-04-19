# Copyright (C) 2018-2019 Lienol
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-adguardhome2
PKG_VERSION:=1.8-20240420
PKG_RELEASE:=1
PKG_MAINTAINER:=<https://github.com/rufengsuixing/luci-app-adguardhome>

LUCI_TITLE:=LuCI app for adguardhome2
LUCI_DEPENDS:=+!wget&&!curl&&!wget-ssl:curl
LUCI_PKGARCH:=all
LUCI_DESCRIPTION:=LuCI support for adguardhome2

define Package/luci-app-adguardhome2/conffiles
/usr/share/AdGuardHome2/links.txt
/etc/config/AdGuardHome2
endef

define Package/luci-app-adguardhome2/postinst
#!/bin/sh
	/etc/init.d/AdGuardHome2 enable >/dev/null 2>&1
	enable=$(uci get AdGuardHome2.AdGuardHome2.enabled 2>/dev/null)
	if [ "$enable" == "1" ]; then
		/etc/init.d/AdGuardHome2 reload >/dev/null 2>&1
	fi
	rm -f /tmp/luci-indexcache
	rm -f /tmp/luci-modulecache/*
exit 0
endef

define Package/luci-app-adguardhome2/prerm
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
     /etc/init.d/AdGuardHome2 disable
     /etc/init.d/AdGuardHome2 stop >/dev/null 2>&1
uci -q batch <<-EOF >/dev/null 2>&1
	delete ucitrack.@AdGuardHome2[-1]
	commit ucitrack
EOF
fi
exit 0
endef

define Package/luci-app-adguardhome2/postrm
#!/bin/sh
rm -rf /etc/AdGuardHome2/
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
