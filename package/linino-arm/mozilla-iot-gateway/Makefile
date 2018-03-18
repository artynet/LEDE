#
# Copyright (C) 2016 OpenWRT/LEDE
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mozilla-iot-gateway
PKG_VERSION:=0.3.1
PKG_RELEASE:=4

PKG_REV:=0.3.1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mozilla-iot/gateway.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.gz

PKG_NODE_VERSION:=8.10.0

include $(INCLUDE_DIR)/package.mk

define Package/mozilla-iot-gateway
  SECTION:=Network
  CATEGORY:=IoT
  TITLE:=Mozilla IoT Gateway
  DEPENDS:=+node +libopenzwave +python +openssl-util
  MAINTAINER:=Arturo Rinaldi <arty.net2@gmail.com>
endef

define Package/mozilla-iot-gateway/description
  Mozilla IoT Things Gateway
endef

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_arch=$(NODEJS_CPU) \
	npm_config_nodedir=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/ \
	npm_config_cache=$(TMP_DIR)/npm-cache \
	npm_config_tmp=$(TMP_DIR)/npm-tmp \
	PREFIX="$(PKG_INSTALL_DIR)/usr/" \
	npm install --build-from-source --target_arch=$(NODEJS_CPU))
	rm -rf $(TMP_DIR)/npm-tmp
	rm -rf $(TMP_DIR)/npm-cache
endef

define Package/mozilla-iot-gateway/install
	$(INSTALL_DIR) $(1)/opt/mozilla-iot-gateway
	$(CP) `ls -d -1 $(PKG_BUILD_DIR)/* | grep -v ipkg` $(1)/opt/mozilla-iot-gateway

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/mozilla-iot-run $(1)/usr/bin
endef

# gateway macros

define Package/mozilla-iot-gateway/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/mozilla-iot-gateway ]
then
	mkdir -p /opt/mozilla-iot-gateway
fi
endef

define Package/mozilla-iot-gateway/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/mozilla-iot-gateway ]
then
	rm -rvf /opt/mozilla-iot-gateway
fi
endef

$(eval $(call BuildPackage,mozilla-iot-gateway))
