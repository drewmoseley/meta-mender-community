MENDER_UBOOT_PRE_SETUP_COMMANDS_beaglebone-yocto = "run findfdt; setenv mender_dtb_name \${fdtfile}; run init_console"

FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
SRC_URI_append_beaglebone-yocto = " file://0001-Make-SPL-smaller-for-BBB.patch "