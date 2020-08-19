#
# Include the primary implementation if either mender-uboot or mender-grub are enabled.
# We need it for mender-grub since we use u-boot to launch grub.
#
include ${@mender_feature_is_enabled("mender-uboot","u-boot-toradex-impl.inc","",d)}
include ${@mender_feature_is_enabled("mender-grub","u-boot-toradex-impl.inc","",d)}
