# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg-utils

DESCRIPTION="A general purpose tile map editor"
HOMEPAGE="https://www.fmod.com/"
SRC_URI="fmodstudio20219linux64-installer.deb"


LICENSE="Apache FMOD"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="fetch"
IUSE="examples"

#REQUIRED_USE=""

RDEPEND="
	>=dev-qt/qtcore-5.15:5
	>=dev-qt/qtdbus-5.15:5
	>=dev-qt/qtdeclarative-5.15:5
	>=dev-qt/qtgui-5.15:5
	>=dev-qt/qtnetwork-5.15:5
	>=dev-qt/qtwidgets-5.15:5
	>=dev-qt/qtwebchannel-5.15:5
	>=dev-qt/qtwebengine-5.15:5
	>=dev-qt/qtwebsockets-5.15:5
"
    # >=dev-libs/icu-56
	# >=dev-libs/openssl-compat-1.0.0
DEPEND="${RDEPEND}"
BDEPEND=""
# 	dev-qt/linguist-tools:5
# 	virtual/pkgconfig
# "

# DOCS=( AUTHORS COPYING NEWS.md README.md )

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please goto https://www.fmod.com/download#fmodstudio and download $SRC_URI, then place into your DISTFILES directory."
}

src_unpack() {
	default

	unpack_deb "${SRC_URI}"
}

# pkg_setup() {
# }

# src_configure() {
# }

src_install() {
	cd ${S}
	# emake INSTALL_ROOT="${D}" install

	# einstalldocs
	cp -pR "${S}/usr" "${D}"

	dodir "/opt/fmodstudio/"
	dodir "/opt/fmodstudio/lib/"

	cp -pR "${S}"/opt/fmodstudio/{documentation,extras,fmodstudio,fmodstudiocl,Scripts} "${D}/opt/fmodstudio/"

	if use examples ; then
		cp -pR "${S}"/opt/fmodstudio/Examples "${D}/opt/fmodstudio/"
	fi

	# cp -p "${S}"/opt/lib/libfsbvorbis.so "${D}/opt/fmodstudio/lib/"
	cp -p "${S}"/opt/fmodstudio/lib/{libfsbvorbis.so,libcrypto.so.1.0.0,libssl.so.1.0.0,libicudata.so.56,libicui18n.so.56,libicuuc.so.56,libstudio.so} "${D}/opt/fmodstudio/lib/"

	# dodir /usr/lib64
	# dosym /opt/fmodstudio/lib/libfsbvorbis.so /usr/lib64/libfsbvorbis.so


	# dodir /usr/bin
	# dosym fmodstudio /opt/fmodstudio/fmodstudio
	# dosym fmodstudiocl /opt/fmodstudio/fmodstudiocl

	# insinto "/opt/fmodstudio"
	# doins "${BUILD_DIR}"/opt/fmodstudio/ \
	# 	  "${BUILD_DIR}"/fmodstudio \
	# 	  "${BUILD_DIR}"/fmodstudiocl \



	# if use examples ; then
	# 	docompress -x /usr/share/doc/${PF}/examples
	# 	dodoc -r examples
	# fi
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
