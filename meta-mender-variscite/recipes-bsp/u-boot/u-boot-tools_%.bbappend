custom_compile() {
	oe_runmake -C ${S} sandbox_defconfig O=${B}
	for config in ${SED_CONFIG_DISABLE}; do
		sed -i -e "s/$config=.*/# $config is not set/" ${B}/.config
	done
	oe_runmake -C ${S} cross_tools NO_SDL=1 O=${B}
}

do_compile_imx6ul-var-dart_class-target() {
	custom_compile
}

do_compile_imx8mm-var-dart_class-target() {
	custom_compile
}

do_compile_imx8mn-var-som_class-target() {
	custom_compile
}

do_compile_imx6ul-var-dart_class-target() {
	custom_compile
}
