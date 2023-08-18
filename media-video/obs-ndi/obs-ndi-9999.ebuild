# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# CMAKE_REMOVE_MODULES_LIST="FindLibObs"
inherit cmake git-r3

DESCRIPTION="Network A/V in OBS Studio with NewTek's NDI technology."
HOMEPAGE="https://github.com/Palakis/obs-ndi"
# COMMIT=""
EGIT_REPO_URI="https://github.com/Palakis/${PN}.git"
# S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt6"

DEPEND="
	qt6? (
		dev-qt/qtbase:6
	)
        !qt6? (
		dev-qt/qtcore:5
	)
	>=media-video/obs-studio-28
	~media-video/ndi-sdk-5.5.4"
RDEPEND="${DEPEND}"
BDEPEND=""

# MY_PV="${PV/_rc/-RC}"
# MY_P="${PN}-${MY_PV}"

# S="${WORKDIR}/${MY_P}"

src_prepare() {
	default

	# Patch the correct path to the NDI library into the source
	sed -e "s:/usr/lib:/usr/lib64:g" \
		-i "src/${PN}.cpp" || die

	cmake_src_prepare
}

src_configure() {
	cmake_src_configure
}

src_install() {
	insinto /usr/lib64/obs-plugins
	doins "../${PF}_build/rundir/Gentoo/obs-plugins/64bit/${PN}.so"

	insinto "/usr/share/obs/obs-plugins/${PN}"
	doins -r "../${PF}_build/rundir/Gentoo/data/obs-plugins/${PN}/data/locale"

	dodoc README.md
}
