# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils toolchain-funcs

STEINBERG_DIR="/opt/Steinberg"
MY_P="${PN/-/}-${PV}"
UNPACKED_DIR="${PN//2/}${PV}"

# einfo "P - $P"
# einfo "UNPACKED_DIR = $UNPACKED_DIR"
# einfo "PN - $PN"
# einfo "MY_P - $MY_P"

DESCRIPTION="Steinberg VST2 SDK 2.4"
HOMEPAGE="https://www.steinberg.net/en/company/developers.html"
SRC_URI="vst_sdk2_4_rev2.zip"

RESTRICT="mirror nostrip fetch"

LICENSE="STEINBERG-VST2-EULA"
SLOT="0"
KEYWORDS="x86 amd64"
FAETURES="-xattr"
IUSE=""

DEPEND="app-arch/unzip"
# WORKDIR="${PORTAGE_BUILDDIR}/work/${MY_P}"
S="${WORKDIR}/${UNPACKED_DIR}"

pkg_nofetch() {
        einfo "Please note that Steinberg's VST2SDK is no longer available for download."
		einfo "You must've already have downloaded it when it was available."
        einfo "Please place"
		einfo "  - $SRC_URI"
		einfo "into your DISTFILES directory."
}

src_unpack() {
	unpack ${A} || die
	# dosym ${MY_P}
}

src_install() {
	cd "${S}"
	dodir "${STEINBERG_DIR}/${MY_P}"
	# einfo "${STEINBERG_DIR}/${MY_P}"

	# TODO - This fails with SMACK errors in usermode, don't know why.
	insinto "${STEINBERG_DIR}/${MY_P}"
	doins -r ./*
	# cp -R ./${UNPACKED_DIR} "${D}${STEINBERG_DIR}/${MY_P}"
# einfo "1..."
	# insinto "/opt/"
	dosym "${STEINBERG_DIR}/${MY_P}" "${STEINBERG_DIR}/vst2sdk"
# einfo "2.."
	newenvd "${FILESDIR}/20vst2-sdk" "20vst2-sdk"
	# cp "${FILESDIR}/20vst2-sdk" "${D}/etc/env.d/20vst2-sdk"
}

pkg_postinst() {
	echo
	elog "${P} has been installed to ${STEINBERG_DIR}/${MY_P}"
	elog "To re-read the license please refer to"
	elog "${STEINBERG_DIR}/${MY_P}/VST Licensing Agreement.rtf"
	echo
}
