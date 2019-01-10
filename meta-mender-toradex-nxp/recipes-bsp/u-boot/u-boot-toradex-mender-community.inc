FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append_mx7 = " \
	file://0001-Set-default-display-resolution-to-800x480-WVGA.patch \
"
MENDER_UBOOT_PRE_SETUP_COMMANDS = "setenv bootargs console=tty1 console=${console},${baudrate}n8 consoleblank=0;"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI_remove = " \
    file://0006-env-Kconfig-Add-descriptions-so-environment-options-.patch \
    file://0003-Integration-of-Mender-boot-code-into-U-Boot.patch \
    file://0004-Disable-CONFIG_BOOTCOMMAND-and-enable-CONFIG_MENDER_.patch \
"

SRC_URI_append = " \
    file://0001-Integration-of-Mender-boot-code-into-U-Boot-v2016.11.patch \
    file://0004-U-Boot-pre-2018-Disable-CONFIG_BOOTCOMMAND-and-enable-CONFIG_MENDER_.patch \
    file://u-boot_v2016.11-backport-of-34255b92e6e68941ab1134299faa86acc5a1abc8.patch \
    file://0001-tools-fix-cross-compiling-tools-when-HOSTCC-is-overr.patch \
    file://0005-fw_env_main.c-Fix-incorrect-size-for-malloc-ed-strin.patch \
"

BOOTENV_SIZE = "0x18000"
