define KernelPackage/spi-sc16is7xx
  SUBMENU:=NXP SPI to UART
  DEFAULT:=m
  TITLE:=SC16IS7XX Generic driver
  KCONFIG:=CONFIG_SERIAL_SC16IS7XX
  FILES:=$(LINUX_DIR)/drivers/tty/serial/sc16is7xx.ko
  AUTOLOAD:=$(call AutoLoad,95,sc16is7xx)
endef

define KernelPackage/spi-sc16is7xx/description
	This package contains the NXP SPI to UART Generic driver
endef

$(eval $(call KernelPackage,spi-sc16is7xx))