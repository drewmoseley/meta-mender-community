FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

require recipes-bsp/u-boot/u-boot-mender.inc

DEPENDS += "u-boot-script-boundary"

MENDER_UBOOT_AUTO_CONFIGURE = "0"
BOOTENV_SIZE = "0x2000"

SRC_URI_remove = "\
    ${@bb.utils.contains('DISTRO', 'b2qt', 'file://0001-Add-support-for-KOE-tx31d200vm0baa-display.patch', '', d)} \
"

SRC_URI += "\
    ${@bb.utils.contains('DISTRO', 'b2qt', 'file://0001-Mender-Add-support-for-KOE-tx31d200vm0baa-display.patch', '', d)} \
    file://0001-ARM-nitrogen8m-Add-support-to-mender.patch \
    file://0002-ARM-son_2g-Add-support-to-mender.patch \
"

do_deploy_append() {
    ln -sf u-boot-spl-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/u-boot-spl.bin-son_2g
    ln -sf u-boot-spl-${MACHINE}-${PV}-${PR} ${DEPLOYDIR}/u-boot-spl.bin-son_2g-sd

    ln -sf u-boot-${PV}-${PR}.bin ${DEPLOYDIR}/u-boot-son_2g.bin
    ln -sf u-boot-${PV}-${PR}.bin ${DEPLOYDIR}/u-boot-son_2g.bin-sd
}