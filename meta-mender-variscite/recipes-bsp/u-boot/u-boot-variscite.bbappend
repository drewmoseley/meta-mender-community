FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

require recipes-bsp/u-boot/u-boot-mender.inc

SRC_URI_append = " file://0001-Switch-to-CONFIG_DISTRO_DEFAULTS-for-bootcmd.patch "

PROVIDES += "u-boot"
RPROVIDES_${PN} += "u-boot"

DEPENDS_append = " bc-native "

make_u_boot_spl_image() {
    install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPLOYDIR}/u-boot-spl-${PV}-${PR}.img
    rm -f ${DEPLOYDIR}/u-boot-spl.img
    ln -sf u-boot-spl-${PV}-${PR}.img ${DEPLOYDIR}/u-boot-spl.img
    dd if=${DEPLOYDIR}/u-boot.img of=${DEPLOYDIR}/u-boot-spl-${PV}-${PR}.img bs=1K seek=68 conv=notrunc
}

do_deploy_append_imx6ul-var-dart() {
    make_u_boot_spl_image
}
