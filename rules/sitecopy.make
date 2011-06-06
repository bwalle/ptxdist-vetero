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
SITECOPY_SUFFIX	:= tar.gz
SITECOPY_URL		:= http://www.manyfish.co.uk/sitecopy/$(SITECOPY).$(SITECOPY_SUFFIX)
SITECOPY_SOURCE	:= $(SRCDIR)/$(SITECOPY).$(SITECOPY_SUFFIX)
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

#SITECOPY_CONF_ENV	:= $(CROSS_ENV)

#
# autoconf
#
SITECOPY_CONF_TOOL	:= autoconf
#SITECOPY_CONF_OPT	:= $(CROSS_AUTOCONF_USR)

#$(STATEDIR)/sitecopy.prepare:
#	@$(call targetinfo)
#	@$(call clean, $(SITECOPY_DIR)/config.cache)
#	cd $(SITECOPY_DIR) && \
#		$(SITECOPY_PATH) $(SITECOPY_ENV) \
#		./configure $(SITECOPY_CONF_OPT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/sitecopy.compile:
#	@$(call targetinfo)
#	@$(call world/compile, SITECOPY)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/sitecopy.install:
#	@$(call targetinfo)
#	@$(call world/install, SITECOPY)
#	@$(call touch)

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

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/sitecopy.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, SITECOPY)

# vim: syntax=make
