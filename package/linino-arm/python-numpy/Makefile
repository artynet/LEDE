#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-numpy
PKG_VERSION:=1.11.2
PKG_RELEASE:=1
PKG_MAINTAINER:=Micke Prag <micke.prag@telldus.se>
PKG_LICENSE:=Python-2.0

PKG_SOURCE:=numpy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/numpy
# PKG_MD5SUM:=2f72100de3e410b36d575e12e82e9d27

PKG_BUILD_DEPENDS:=python-setuptools

PKG_BUILD_DIR:=$(BUILD_DIR)/python-numpy-$(PKG_VERSION)
PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-numpy
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-numpy
  URL:=http://www.numpy.org
  DEPENDS:=+python +python-setuptools +libgfortran +openblas +liblapack @INSTALL_GFORTRAN
endef

define Package/python3-numpy/description
 NumPy is a general-purpose array-processing package designed to
 efficiently manipulate large multi-dimensional arrays of arbitrary
 records without sacrificing too much speed for small multi-dimensional
 arrays.  NumPy is built on the Numeric code base and adds features
 introduced by numarray as well as an extended C-API and the ability to
 create arrays of arbitrary type which also makes NumPy suitable for
 interfacing with general-purpose data-base applications.
 There are also basic facilities for discrete fourier transform
 basic linear algebra and random number generation.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	rm $(PKG_BUILD_DIR)/site.cfg.example
	touch $(PKG_BUILD_DIR)/site.cfg
	echo "[DEFAULT]" >> $(PKG_BUILD_DIR)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(PKG_BUILD_DIR)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(PKG_BUILD_DIR)/site.cfg
	echo "libraries = blas,lapack" >> $(PKG_BUILD_DIR)/site.cfg
endef

define Build/Compile
	$(call Build/Compile/PyMod,,install --prefix=/usr --root="$(PKG_INSTALL_DIR)")
endef

define Build/InstallDev
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

define Package/python-numpy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call PyPackage,python-numpy))
$(eval $(call BuildPackage,python-numpy))
