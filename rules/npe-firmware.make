# -*-makefile-*-
#
# Copyright (C) 2012 by <>Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_NPE_FIRMWARE) += npe-firmware

NPE_FIRMWARE_VERSION	:= 20120202

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/npe-firmware.targetinstall:
	@$(call targetinfo)

	@$(call install_init, npe-firmware)
	@$(call install_fixup,npe-firmware,PRIORITY,optional)
	@$(call install_fixup,npe-firmware,SECTION,base)
	@$(call install_fixup,npe-firmware,AUTHOR,"<>Bernhard Walle <bernhard@bwalle.de>")
	@$(call install_fixup,npe-firmware,DESCRIPTION,missing)

	@$(call install_archive,npe-firmware, -, -, \
		$(PTXDIST_WORKSPACE)/local_src/npe-firmware-$(NPE_FIRMWARE_VERSION).tar.bz2)

	@$(call install_finish,npe-firmware)

	@$(call touch)

# vim: syntax=make
