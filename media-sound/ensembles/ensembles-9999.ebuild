# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils vala meson xdg-utils

if [[ ${PV} == 9999 ]]; then
    EGIT_REPO_URI="https://github.com/SubhadeepJasu/${PN}.git"
    EGIT_BRANCH="full_remediation"
	inherit git-r3
else
	SRC_URI="https://gitlab.freedesktop.org/${PN}/${PN}/-/archive/${PV}/${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
fi

DESCRIPTION="A digital arranger workstation powered by FluidSynth"
HOMEPAGE=""

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND="
    dev-libs/granite
    gui-libs/libhandy
    media-libs/portmidi
"

DEPEND="
    $(vala_depend)
    ${BDEPEND}
"

src_prepare() {
    vala_src_prepare
    default
}

pkg_postinst() {
    gnome2_gconf_install
    gnome2_schemas_update
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
    gnome2_gconf_uninstall
    gnome2_schemas_update
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	xdg_icon_cache_update
}
