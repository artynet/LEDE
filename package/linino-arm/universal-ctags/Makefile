#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=universal-ctags
PKG_VERSION:=5.8
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/universal-ctags/ctags.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=7918d19
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/universal-ctags
	TITLE:=A multilanguage implementation of Ctags NG
	URL:=https://github.com/universal-ctags/ctags.git
	SECTION:=utils
	CATEGORY:=Utilities
	DEPENDS:=+libc +librt +libxml2
endef

define Package/universal-ctags/description
	A mix of ctags and anjuta-tags for the perfect C++ ctags NG
endef

define Build/Prepare
	$(Build/Prepare/Default)
	# we have to download additional stuff before patching
	(cd $(PKG_BUILD_DIR) && ./autogen.sh)
endef

CONFGIGURE_ARGS = \
	--host=$(REAL_GNU_TARGET_NAME)

define Package/universal-ctags/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ctags $(1)/usr/bin
endef

$(eval $(call BuildPackage,universal-ctags))
