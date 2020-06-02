FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append_mx7 = " \
	file://0001-Set-default-display-resolution-to-800x480-WVGA.patch \
"
MENDER_UBOOT_PRE_SETUP_COMMANDS = "setenv bootargs console=tty1 console=${console},${baudrate}n8 consoleblank=0;"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI_remove = " \
    file://0006-env-Kconfig-Add-descriptions-so-environment-options-.patch \
"

SRC_URI_remove_apalis-imx6 = " file://0003-Integration-of-Mender-boot-code-into-U-Boot.patch"
SRC_URI_append_apalis-imx6 = " file://0001-Toradex-apalis-imx6-integration-of-Mender-boot-code-.patch"

BOOTENV_SIZE = "0x18000"

PROVIDES += "u-boot"
RPROVIDES_${PN} = "u-boot"
