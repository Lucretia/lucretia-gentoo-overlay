# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="NewTek NDI SDK"
FILE_NAME="InstallNDISDK_v4_Linux"
SHELL_NAME="${FILE_NAME}.sh"
ARCHIVE_NAME="${FILE_NAME}.tar.gz"
SRC_URI="http://new.tk/NDISDKLINUX -> ${ARCHIVE_NAME}"

LICENSE="NDI_EULA_END"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
#RESTRICT="fetch"

HOMEPAGE="https://www.newtek.com/ndi/sdk/"
# supress QA warnings about stripping etc., i.e. stuff we cannot change since we install prebuilt binaries
QA_PREBUILT="usr/lib64/libndi.so.${PV}"

DEPEND=""
RDEPEND="
net-dns/avahi[dbus]
${DEPEND}"

# pkg_nofetch() {
# 	einfo "Please visit ${HOMEPAGE} and register for the NDI developer program."
# 	einfo "From the mail you will revice, download the linux sdk and move it to ${DISTDIR}"
# 	einfo ""
# 	einfo "  expected filenames: ${SRC_URI}"
# 	einfo ""
# 	einfo "The license should be shown and has to be accepted before the download"
# 	einfo "starts."
# }

src_unpack() {
	tar -xvpf "${DISTDIR}/${ARCHIVE_NAME}"
	ARCHIVE=`awk '/^__NDI_ARCHIVE_BEGIN__/ { print NR+1; exit 0; }' "${SHELL_NAME}"`
	tail -n+$ARCHIVE "${SHELL_NAME}" | tar xvz
	S="${WORKDIR}/NDI SDK for Linux/"
}

src_install() {
	dolib "${S}/lib/x86_64-linux-gnu/libndi.so.${PV}"
	dosym "libndi.so.${PV}" "/usr/lib64/libndi.so.4"
	dosym "libndi.so.4" "/usr/lib64/libndi.so"
	for header in `ls "${S}/include/"`; do
		doheader "${S}/include/${header}"
	done
}
