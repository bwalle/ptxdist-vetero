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
PACKAGES-$(PTXCONF_VETERO) += vetero

#
# Paths and names
#
VETERO		:= vetero
VETERO_VERSION	:= master
VETERO_URL		:= file://$(PTXDIST_WORKSPACE)/local_src/$(VETERO).git
VETERO_DIR		:= $(BUILDDIR)/$(VETERO)
VETERO_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(VETERO_SOURCE):
	@$(call targetinfo)
	@$(call get, VETERO)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#VETERO_CONF_ENV	:= $(CROSS_ENV)

#
# cmake
#
VETERO_CONF_TOOL	:= cmake
#VETERO_CONF_OPT	:= $(CROSS_CMAKE_USR)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/vetero.targetinstall:
	@$(call targetinfo)

	@$(call install_init, vetero)
	@$(call install_fixup, vetero, PRIORITY, optional)
	@$(call install_fixup, vetero, SECTION, base)
	@$(call install_fixup, vetero, AUTHOR, "Bernhard Walle <bernhard@bwalle.de>")
	@$(call install_fixup, vetero, DESCRIPTION, missing)

#	# copy all binaries

	@for i in $(shell cd $(VETERO_PKGDIR) && find bin sbin usr/bin usr/sbin -type f); do \
		$(call install_copy, vetero, 0, 0, 0755, -, /$$i); \
	done
	$(call install_copy, vetero, 0, 0, 0644, -, /usr/share/current_weather.svg); \

#	# install the init script
	@$(call install_alternative, vetero, 0, 0, 0755, /etc/init.d/vetero)
	@$(call install_link, vetero, \
		../init.d/vetero, \
		/etc/rc.d/S50vetero)

	@$(call install_finish, vetero)

	@$(call touch)

# vim: syntax=make
