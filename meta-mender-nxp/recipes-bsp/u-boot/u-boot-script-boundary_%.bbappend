FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://0001-bootscript-add-Mender-support.patch \
    file://0002-bootscript-Use-dynamic-fdt_name.patch \
"
