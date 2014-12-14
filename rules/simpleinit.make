# -*-makefile-*-
#
# Copyright (C) 2012 by Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_SIMPLEINIT) += simpleinit

#
# Paths and names
#
SIMPLEINIT_VERSION	:= 0.1
SIMPLEINIT_MD5		:=
SIMPLEINIT		:= simpleinit
SIMPLEINIT_URL		:= file://local_src/$(SIMPLEINIT)
SIMPLEINIT_DIR		:= $(BUILDDIR)/$(SIMPLEINIT)
SIMPLEINIT_LICENSE	:= unknown
SIMPLEINIT_DEVPKG	:= NO

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

SIMPLEINIT_CONF_TOOL	:= NO
SIMPLEINIT_MAKE_ENV	:= $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/simpleinit.targetinstall:
	@$(call targetinfo)

	@$(call install_init, simpleinit)
	@$(call install_fixup, simpleinit,PRIORITY,optional)
	@$(call install_fixup, simpleinit,SECTION,base)
	@$(call install_fixup, simpleinit,AUTHOR,"Bernhard Walle <bernhard@bwalle.de>")
	@$(call install_fixup, simpleinit,DESCRIPTION,missing)

	@$(call install_copy, simpleinit, 0, 0, 0755, -, /init)
	@$(call install_alternative, simpleinit, 0, 0, 0644, /init.local)

	@$(call install_finish, simpleinit)

	@$(call touch)

# vim: syntax=make
