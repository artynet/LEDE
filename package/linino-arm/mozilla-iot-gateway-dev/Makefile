#
# Copyright (C) 2016 OpenWRT/LEDE
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mozilla-iot-gateway-dev
PKG_VERSION:=0.4.0-beta1
PKG_RELEASE:=1

PKG_REV:=0.4.0-lede-beta1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/artynet/gateway.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_REV).tar.gz

PKG_NODE_VERSION:=8.9.4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

include $(INCLUDE_DIR)/package.mk

define Package/mozilla-iot-gateway-dev
  SECTION:=Network
  CATEGORY:=IoT
  TITLE:=Mozilla IoT Gateway
  DEPENDS:=+libc +libstdcpp +node +libopenzwave +python +openssl-util
  MAINTAINER:=Arturo Rinaldi <arty.net2@gmail.com>
endef

define Package/mozilla-iot-gateway-dev/description
  Mozilla IoT Things Gateway (Dev Code)
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/build
	$(TAR) xvf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)/build --strip-components=1
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
endef

NODEJS_CPU:=$(subst powerpc,ppc,$(subst aarch64,arm64,$(subst x86_64,x64,$(subst i386,ia32,$(ARCH)))))

define Build/Compile
	$(MAKE_VARS) \
	$(MAKE_FLAGS) \
	npm_config_arch=$(NODEJS_CPU) \
	npm_config_nodedir=$(BUILD_DIR)/node-v$(PKG_NODE_VERSION)/ \
	npm_config_cache=$(TMP_DIR)/npm-cache \
	npm_config_tmp=$(TMP_DIR)/npm-tmp \
	PREFIX="$(PKG_INSTALL_DIR)/usr/" \
	npm install --build-from-source --target_arch=$(NODEJS_CPU) -g $(DL_DIR)/$(PKG_SOURCE)
	rm -rf $(TMP_DIR)/npm-tmp
	rm -rf $(TMP_DIR)/npm-cache
endef

define Package/mozilla-iot-gateway-dev/install
	$(INSTALL_DIR) $(1)/opt/mozilla-iot-gateway-dev
	$(CP) -r $(PKG_BUILD_DIR)/build/* $(1)/opt/mozilla-iot-gateway-dev
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/node_modules/things-gateway/node_modules $(1)/opt/mozilla-iot-gateway-dev

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/mozilla-iot-run-dev $(1)/usr/bin
endef

# gateway macros

define Package/mozilla-iot-gateway-dev/preinst
#!/bin/sh
# check if we are on a real system
if [ ! -d /opt/mozilla-iot-gateway-dev ]
then
	mkdir -p /opt/mozilla-iot-gateway-dev
fi
endef

define Package/mozilla-iot-gateway-dev/postrm
#!/bin/sh
# check if we are on a real system
if [ -d /opt/mozilla-iot-gateway-dev ]
then
	rm -rvf /opt/mozilla-iot-gateway-dev
fi
endef

$(eval $(call BuildPackage,mozilla-iot-gateway-dev))
