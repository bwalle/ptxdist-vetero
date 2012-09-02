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
VETERO_VERSION	:= 0.4.6
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

#
# cmake
#
VETERO_CONF_TOOL	:= cmake

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

#	# copy all files
	$(call install_tree, vetero, 0, 0, $(VETERO_PKGDIR), /)

#	# install the init script
	@$(call install_alternative, vetero, 0, 0, 0755, /etc/init.d/vetero)
	@$(call install_link, vetero, \
		../init.d/vetero, \
		/etc/rc.d/S50vetero)

	@$(call install_alternative, vetero, 0, 0, 0755, /etc/rc.once.d/0vetero)
	@$(call install_alternative, vetero, 0, 0, 0755, /etc/rc.once.d/1vetero_sysinit)

#	# main page
	@$(call install_alternative, vetero, 0, 0, 0644, /var/www/index.html)

#	# Small backup script
	@$(call install_alternative, vetero, 0, 0, 0755, /usr/sbin/veterobackup)
	@$(call install_alternative, vetero, 0, 0, 0600, /var/spool/cron/crontabs/root)

#	# Correct the PATH for root logins via SSH
	@$(call install_alternative, vetero, 0, 0, 0600, /etc/profile.local)

	@$(call install_finish, vetero)

	@$(call touch)

# vim: syntax=make
