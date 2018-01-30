#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openblas
PKG_VERSION:=0.2.20
PKG_RELEASE:=1

PKG_REV:=09e397e

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/xianyi/OpenBLAS.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV)
PKG_SOURCE_VERSION=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz
PKG_INSTALL:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/openblas-$(PKG_VERSION)-$(PKG_REV)

PKG_BUILD_DEPENDS:=@INSTALL_GFORTRAN

PKG_INSTALL:=0

include $(INCLUDE_DIR)/package.mk

define Package/openblas
  TITLE:=The OpenBLAS (Basic Linear Algebra Subprograms)
  SECTION:=libs
  DEFAULT:=m
  CATEGORY:=Libraries
  DEPENDS:=+libpthread +libc +libstdcpp +libgfortran
  URL:=http://www.netlib.org/blas/
endef

define Package/openblas/description
	The OpenBLAS (Basic Linear Algebra Subprograms).
endef

define Build/Compile
	$(MAKE) CC=$(REAL_GNU_TARGET_NAME)-gcc FC=$(REAL_GNU_TARGET_NAME)-gfortran HOSTCC=gcc \
		TARGET=ARMV7 CROSS=1 CROSS_SUFFIX=$(REAL_GNU_TARGET_NAME)- -C $(PKG_BUILD_DIR)
	$(MAKE) PREFIX=$(PKG_INSTALL_DIR) -C $(PKG_BUILD_DIR) install
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libopenblas*{.a,.so*} $(1)/usr/lib/
	$(CP) -R $(PKG_INSTALL_DIR)/lib/cmake $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/lib/pkgconfig/openblas.pc $(1)/usr/lib/pkgconfig/
endef

define Package/openblas/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/lib/libopenblas*{.a,.so*} $(1)/usr/lib
endef

$(eval $(call BuildPackage,openblas))
