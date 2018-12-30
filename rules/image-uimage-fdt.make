# -*-makefile-*-
#
# Copyright (C) 2014 by Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
IMAGE_PACKAGES-$(PTXCONF_IMAGE_UIMAGE_FDT) += image-kernel-uimage-fdt

#
# Paths and names
#
IMAGE_UIMAGE_FDT	:= image-kernel-uimage-fdt
IMAGE_UIMAGE_FDT_IMAGE	:= $(IMAGEDIR)/uImage
IMAGE_BOOT_VFAT_DIR	:= $(BUILDDIR)/$(IMAGE_BOOT_VFAT)
IMAGE_BOOT_VFAT_IMAGE	:= $(IMAGEDIR)/boot.vfat
IMAGE_BOOT_VFAT_DATA	:= \
	$(wildcard $(PTXDIST_PLATFORMCONFIGDIR)/firmware/*.bin) \
	$(wildcard $(PTXDIST_PLATFORMCONFIGDIR)/firmware/*.elf) \
	$(wildcard $(PTXDIST_PLATFORMCONFIGDIR)/firmware/*.dat) \
	$(PTXDIST_TEMPDIR)/config.txt \
	$(PTXDIST_PLATFORMCONFIGDIR)/cmdline.txt
IMAGE_BOOT_VFAT_CONFIG	:= boot-vfat.config

# ----------------------------------------------------------------------------
# Image
# ----------------------------------------------------------------------------


$(IMAGE_UIMAGE_FDT_IMAGE): $(IMAGEDIR)/linuximage $(IMAGEDIR)/kirkwood-dockstar.dtb
	@$(call targetinfo)
	@echo "Generating final kernel image including FDT"
	@(cd $(IMAGEDIR) ; \
		cat linuximage kirkwood-dockstar.dtb > zImage; \
		mkimage \
			-A arm \
			-O linux \
			-C none \
			-T kernel \
			-a 0x00008000 \
			-e 0x00008000 \
			-n 'Linux-$(PTXCONF_KERNEL_VERSION)' \
			-d zImage \
			uImage)
	@$(call finish)

# vim: syntax=make
