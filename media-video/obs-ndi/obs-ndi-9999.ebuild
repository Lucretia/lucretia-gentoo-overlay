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
IUSE=""

DEPEND=">=media-video/obs-studio-25.0.8-r1
		dev-qt/qtwidgets:5
		dev-qt/qtgui:5
		dev-qt/qtcore:5
"
RDEPEND="${DEPEND}"
BDEPEND=""
# PDEPEND="media-video/v4l2loopback"

PATCHES=(
	"${FILESDIR}/0001-Fix-for-gentoo.patch"
)

# src_prepare() {
# 	sed -i -e '/include(external\/FindLibObs.cmake)/d' -e 's#../UI#UI#' CMakeLists.txt
# 	cmake_src_prepare
# }

src_configure() {
	mycmakeargs=(
		-DLIBOBS_INCLUDE_DIR="/usr/include/obs/"
	)
	cmake_src_configure
}
