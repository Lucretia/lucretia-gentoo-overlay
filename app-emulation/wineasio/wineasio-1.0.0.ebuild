EAPI=6

# inherit eutils toolchain-funcs multilib multilib-minimal
inherit eutils toolchain-funcs multilib-minimal


STEINBERG_DIR="/opt/Steinberg"
DESCRIPTION="ASIO driver for WINE"
HOMEPAGE="https://github.com/wineasio/wineasio"
SRC_URI="https://github.com/wineasio/wineasio/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

IUSE=""
SLOT="0"

FEATURES="preserve-libs"
BDEPEND="|| ( app-emulation/wine-vanilla app-emulation/wine-staging )"

RDEPEND="media-libs/asiosdk"
DEPEND="virtual/wine
		virtual/jack
		${RDEPEND}"

#WINEASIO_ALL_WINES="$(eselect wine list |tail -n +2 | awk '{ print $2 }')"
#WINEASIO_SELECTED_WINE="$(eselect wine list |grep '*'|awk '{ print $1 }'|tr -d []`)"

src_prepare()
{
	epatch "${FILESDIR}/0001-Create-the-fake-DLL-s.patch"
	mkdir ./rtaudio/include
	# pushd ./rtaudio/include
	# ln -s "${STEINBERG_DIR}/asiosdk"/common/asio.h
	# popd
	cp "${STEINBERG_DIR}/asiosdk"/common/asio.h ./rtaudio/include/

	multilib_copy_sources
	eapply_user
	# default
}

multilib_src_compile()
{
	case "${ABI}" in
		"x86")
			# cp ../wineasio/* .

			emake 32 || die "make failed"
			;;

		"amd64")
			# cp ../wineasio/* .
			./prepare_64bit_asio.sh

			emake 64 || die "make failed"
			;;
	esac
}

multilib_src_install()
{
	case "${ABI}" in
		"x86")
			UNIX_DIRS=$(find /usr/$(get_libdir)/wine-*/wine/i386-unix* -type d -print)

			for d in ${UNIX_DIRS}; do
				# einfo "d => ${d}"
				exeinto ${d}

				doexe build32/wineasio.dll.so
			done

			WIN_DIRS=$(find /usr/$(get_libdir)/wine-*/wine/i386-windows* -type d -print)

			for d in ${WIN_DIRS}; do
				exeinto ${d}

				doexe build32/wineasio.dll
			done
			;;

		"amd64")
			UNIX_DIRS=$(find /usr/$(get_libdir)/wine-*/wine/x86_64-unix* -type d -print)

			for d in ${UNIX_DIRS}; do
				exeinto ${d}

				doexe build64/wineasio.dll.so
			done

			WIN_DIRS=$(find /usr/$(get_libdir)/wine-*/wine/x86_64-windows* -type d -print)

			for d in ${WIN_DIRS}; do
				exeinto ${d}

				doexe build64/wineasio.dll
			done
			;;
	esac
}

pkg_postinst() {
		echo
		elog "When you want to use WineASIO within a Win prefix, you need to register the DLL."
		elog
		elog "32 Bit:"
		elog
		elog "[env WINEPREFIX=~/asioapp] wine regsvr32 wineasio.dll"
		elog
		elog "or"
		elog
		elog "[env WINEPREFIX=~/asioapp] wine regsvr32 /usr/lib/wine-staging-<version>/wine/i386-windows/wineasio.dll"
		elog
		elog "64 Bit:"
		elog
		elog "[env WINEPREFIX=~/asioapp] wine64 regsvr32 wineasio.dll"
		elog
		elog "or"
		elog
		elog "[env WINEPREFIX=~/asioapp] wine regsvr32 /usr/lib/wine-staging-<version>/wine/x86_64-windows/wineasio.dll"
		elog
		elog "Followed by:"
		elog
		elog ""
		elog
		elog "AS THE USER who uses wine!"
		elog "Then open winecfg -> Audio -> and enable ONLY the ALSA driver!"
		echo
}
