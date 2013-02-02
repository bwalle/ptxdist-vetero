# -*-makefile-*-
#
# Copyright (C) 2012 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
IMAGE_PACKAGES-$(PTXCONF_IMAGE_HDIMAGE) += image-hdimage

#
# Paths and names
#
IMAGE_HDIMAGE		:= image-hdimage
IMAGE_HDIMAGE_DIR	:= $(BUILDDIR)/$(IMAGE_HDIMAGE)
IMAGE_HDIMAGE_IMAGE	:= $(IMAGEDIR)/hd.img
IMAGE_HDIMAGE_CONFIG	:= hdimage.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------

$(IMAGE_HDIMAGE_IMAGE):
	@$(call targetinfo)
	@$(call image/genimage, IMAGE_HDIMAGE)
	@$(call finish)

# vim: syntax=make
