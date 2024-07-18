# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib

DESCRIPTION="A set of LV2 plugins from the Guitarix project"
HOMEPAGE="http://guitarix.org/"
MY_PN="GxPlugins.lv2"

if [[ "${PV}" = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/brummer10/${MY_PN}.git"
	# S="${WORKDIR}/${MY_PN}-${PV}"
	S="${WORKDIR}/gxplugins-lv2-${PV}"
else
	SRC_URI="https://github.com/brummer10/${MY_PN}/releases/download/v${PV}/${MY_PN%.*}_${PV//.}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${MY_PN}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="x11-base/xorg-proto
	x11-libs/libX11
	x11-libs/cairo
	media-libs/lv2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"


src_prepare() {
	find -name "Makefile" -exec sed -i -e "s#INSTALL_DIR = /usr/lib/lv2#INSTALL_DIR=/usr/$(get_libdir)/lv2#g" '{}' ';' || die

	default
}
