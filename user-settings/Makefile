#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=user-settings
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/user-settings
  SECTION:=Custom
  CATEGORY:=Extra packages
  TITLE:=User Settings
  MAINTAINER:=leen
  PKGARCH:=all
endef

lan_ip_packages:=
define LanIpPackageTemplate
  define Package/user-settings-lan-ip-$(1)
    SECTION:=Custom
    CATEGORY:=Extra packages
    TITLE:=User Network Lan 192.168.$(1).1
    MAINTAINER:=leen
    PKGARCH:=all
  endef

  define Package/user-settings-lan-ip-$(1)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
  cat <<-EOF > $(1)/etc/uci-defaults/12_network-lan-ip-$(1)
  #!/bin/sh
  uci -q get network && {
    uci -q batch <<-EOF >/dev/null
      set network.lan.ipaddr='192.168.$(1).1'
      commit network
    EOF
  }
  EOF
  endef

  lan_ip_packages+=user-settings-lan-ip-$(1)
endef

$(foreach p,1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90 100 101 102 200,\
  $(eval $(call LanIpPackageTemplate,$(p)))
)

define Package/user-settings/conffiles
/etc/config/
/etc/nginx/
endef

define Build/Prepare
	# chmod -R +x ./files/etc/rc.d ./files/etc/uci-defaults >/dev/null || true
endef

define Build/Compile
endef

define Package/user-settings/install
	$(INSTALL_DIR) $(1)/usr/share/build
	$(CP) $(TOPDIR)/.config $1/usr/share/build/
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,user-settings))
$(foreach p,$(lan_ip_packages),\
  $(eval $(call BuildPackage,$(p)))\
)
