# -*-makefile-*-
#
# Copyright (C) 2011 by Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_SITECOPY) += sitecopy

#
# Paths and names
#
SITECOPY_VERSION	:= 0.16.6
SITECOPY_MD5		:= b3aeb5a5f00af3db90b408e8c32a6c01
SITECOPY		:= sitecopy-$(SITECOPY_VERSION)
SITECOPY_SUFFIX		:= tar.gz
SITECOPY_URL		:= http://www.manyfish.co.uk/sitecopy/$(SITECOPY).$(SITECOPY_SUFFIX)
SITECOPY_SOURCE	:= 	$(SRCDIR)/$(SITECOPY).$(SITECOPY_SUFFIX)
SITECOPY_DIR		:= $(BUILDDIR)/$(SITECOPY)
SITECOPY_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(SITECOPY_SOURCE):
	@$(call targetinfo)
	@$(call get, SITECOPY)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#
# autoconf
#
SITECOPY_CONF_TOOL	:= autoconf

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/sitecopy.targetinstall:
	@$(call targetinfo)

	@$(call install_init, sitecopy)
	@$(call install_fixup, sitecopy,PRIORITY,optional)
	@$(call install_fixup, sitecopy,SECTION,base)
	@$(call install_fixup, sitecopy,AUTHOR,"Bernhard Walle <bernhard@bwalle.de>")
	@$(call install_fixup, sitecopy,DESCRIPTION,missing)

	@$(call install_copy, sitecopy, 0, 0, 0755, -, /usr/bin/sitecopy)

	@$(call install_finish, sitecopy)

	@$(call touch)

# vim: syntax=make
