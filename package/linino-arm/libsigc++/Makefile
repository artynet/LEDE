#
# Copyright (C) 3.06-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libsigc++
PKG_VERSION:=2.99.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNOME/libsigc++/2.99
PKG_MD5SUM:=e46dc6e7db27521c014ac3b1ca07d4dd
PKG_MAINTAINER:=Steven Barth <cyrus@openwrt.org>
PKG_LICENSE:=LGPL-2.1

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libsigcxx
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=typesafe callback system for standard C++
  URL:=http://libsigc.sourceforge.net/
  DEPENDS:=+libstdcpp
endef

define Package/libsigcxx/description
 It allows you to define signals and to connect those signals to any
 callback function, either global or a member function, regardless of
 whether it is static or virtual.
endef

TARGET_CFLAGS += $(FPIC)

TARGET_CPPFLAGS +=  \
	-fno-strict-aliasing -fno-inline \

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/sigc++-3.0 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsigc-3.0.{a,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/sigc++-3.0 $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/sigc++-3.0.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libsigcxx/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libsigc-3.0.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libsigcxx))
