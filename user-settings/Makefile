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

define Package/user-settings-lan-ip-6
  SECTION:=Custom
  CATEGORY:=Extra packages
  TITLE:=User Network Lan 192.168.6.1
  MAINTAINER:=leen
  PKGARCH:=all
endef

define Package/user-settings-lan-ip-10
  SECTION:=Custom
  CATEGORY:=Extra packages
  TITLE:=User Network Lan 192.168.10.1
  MAINTAINER:=leen
  PKGARCH:=all
endef

define Package/user-settings-lan-ip-100
  SECTION:=Custom
  CATEGORY:=Extra packages
  TITLE:=User Network Lan 192.168.100.1
  MAINTAINER:=leen
  PKGARCH:=all
endef
#   DEPENDS:=+base-files

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

define Package/user-settings-lan-ip-6/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci-defaults/lan-ip-6.uci.default $(1)/etc/uci-defaults/12_network-lan-ip-6
endef

define Package/user-settings-lan-ip-10/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci-defaults/lan-ip-10.uci.default $(1)/etc/uci-defaults/12_network-lan-ip-10
endef

define Package/user-settings-lan-ip-100/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./uci-defaults/lan-ip-100.uci.default $(1)/etc/uci-defaults/12_network-lan-ip-100
endef

$(eval $(call BuildPackage,user-settings))
$(eval $(call BuildPackage,user-settings-lan-ip-6))
$(eval $(call BuildPackage,user-settings-lan-ip-10))
$(eval $(call BuildPackage,user-settings-lan-ip-100))
