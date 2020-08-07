FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_mender-grub = " \
     file://efi.cfg \
"
