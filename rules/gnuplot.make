# -*-makefile-*-
#
# Copyright (C) 2004 by Robert Schwebel
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_GNUPLOT) += gnuplot

#
# Paths and names
#
GNUPLOT_VERSION	:= 4.4.3
GNUPLOT_MD5	:= 639603752996f4923bc02c895fa03b45
GNUPLOT		:= gnuplot-$(GNUPLOT_VERSION)
GNUPLOT_SUFFIX	:= tar.gz
GNUPLOT_URL	:= $(PTXCONF_SETUP_SFMIRROR)/gnuplot/$(GNUPLOT).$(GNUPLOT_SUFFIX)
GNUPLOT_SOURCE	:= $(SRCDIR)/$(GNUPLOT).$(GNUPLOT_SUFFIX)
GNUPLOT_DIR	:= $(BUILDDIR)/$(GNUPLOT)


# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(GNUPLOT_SOURCE):
	@$(call targetinfo)
	@$(call get, GNUPLOT)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

GNUPLOT_PATH	:= PATH=$(CROSS_PATH)
GNUPLOT_ENV	:= $(CROSS_ENV)

#
# autoconf
#
# 4.2.4: --disable-datastrings is broken
#        --disable-binary-data-file is broken
#
GNUPLOT_AUTOCONF = \
	$(CROSS_AUTOCONF_USR) \
	--disable-history-file \
	--disable-x11-mbfonts \
	--enable-binary-data-file \
	--disable-with-image \
	--disable-binary-x11-polygon \
	--disable-thin-splines \
	--enable-datastrings \
	--disable-histograms \
	--disable-objects \
	--disable-stringvariables \
	--disable-macros \
	--disable-iris \
	--disable-mgr \
	--disable-rgip \
	--disable-h3d-quadtree \
	--disable-h3d-gridbox \
	--disable-wxwidgets \
	--without-kpsexpand \
	--without-lasergnu \
	--without-linux-vga \
	--without-ggi \
	--without-xmi \
	--with-readline=builtin \
	--without-cwdrc \
	--without-lisp-files \
	--without-row-help \
	--without-tutorial \
	--without-wx-config \
	--without-lua

ifdef PTXCONF_GNUPLOT_FITERRVARS
GNUPLOT_AUTOCONF += --enable-fiterrvars
else
GNUPLOT_AUTOCONF += --disable-fiterrvars
endif

ifdef PTXCONF_GNUPLOT_X
GNUPLOT_AUTOCONF += --with-x --enable-mouse
else
GNUPLOT_AUTOCONF += --without-x --disable-mouse
endif

ifdef PTXCONF_GNUPLOT_PLOT
GNUPLOT_AUTOCONF += --with-plot
else
GNUPLOT_AUTOCONF += --without-plot
endif

ifdef PTXCONF_GNUPLOT_PNG
GNUPLOT_AUTOCONF += --with-png
else
GNUPLOT_AUTOCONF += --without-png
endif

ifdef PTXCONF_GNUPLOT_GD
GNUPLOT_AUTOCONF += --with-gd
else
GNUPLOT_AUTOCONF += --without-gd
endif

ifdef PTXCONF_GNUPLOT_PDF
GNUPLOT_AUTOCONF += --with-pdf
else
GNUPLOT_AUTOCONF += --without-pdf
endif

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/gnuplot.compile:
	@$(call targetinfo)
	cd $(GNUPLOT_DIR)/src && $(GNUPLOT_PATH) $(MAKE) gnuplot $(PARALLELMFLAGS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/gnuplot.targetinstall:
	@$(call targetinfo)

	@$(call install_init, gnuplot)
	@$(call install_fixup, gnuplot,PRIORITY,optional)
	@$(call install_fixup, gnuplot,SECTION,base)
	@$(call install_fixup, gnuplot,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, gnuplot,DESCRIPTION,missing)

	@$(call install_copy, gnuplot, 0, 0, 0755, -, /usr/bin/gnuplot)

ifdef PTXCONF_GNUPLOT_HELP
	@$(call install_copy, gnuplot, 0, 0, 0644, -, /usr/share/gnuplot/4.4/gnuplot.gih)
endif

ifdef PTXCONF_GNUPLOT_POSTSCRIPT
	@$(call install_tree, gnuplot, 0, 0, -, /usr/share/gnuplot/4.4/PostScript)
endif

ifdef PTXCONF_GNUPLOT_JS
	@$(call install_tree, gnuplot, 0, 0, -, /usr/share/gnuplot/4.4/js)
endif

ifdef PTXCONF_GNUPLOT_X
	@$(call install_copy, gnuplot, 0, 0, 0755, -, /usr/libexec/gnuplot/4.4/gnuplot_x11)
endif

	@$(call install_finish, gnuplot)

	@$(call touch)

# vim: syntax=make
