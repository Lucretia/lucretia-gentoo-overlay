# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit eutils git-r3

DESCRIPTION="Surge is an open source digital synthesizer"
HOMEPAGE="https://surge-synthesizer.github.io//"
EGIT_REPO_URI="https://github.com/surge-synthesizer/surge.git"
EGIT_COMMIT="release_${PV}"
LICENSE="GPL3"
SLOT="0"
KEYWORDS="amd64"
DEPEND="x11-libs/cairo
        x11-libs/libxkbcommon
        x11-libs/libxcb"
RDEPEND=${DEPEND}
PATCHES=("${FILESDIR}"/install.patch)


src_compile() {
    ${S}/build-linux.sh build
}

src_install() {
    dodir /usr/lib/vst
    dodir /usr/lib/vst3
    dodir /usr/lib/lv2
    dodir /usr/bin
    dodir /usr/share/surge
    vst2_dest_path="${D}/usr/lib/vst" vst3_dest_path="${D}/usr/lib/vst3" lv2_dest_path="${D}/usr/lib/lv2" headless_dest_path="${D}/usr/bin" data_path="${D}/usr/share/surge" ${S}/build-linux.sh install
}
