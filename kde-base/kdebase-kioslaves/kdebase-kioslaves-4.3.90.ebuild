# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdebase-runtime"
KMMODULE="kioslave"
inherit kde4-meta

DESCRIPTION="kioslave: the kde VFS framework - kioslave plugins present a filesystem-like view of arbitrary data"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="+bzip2 exif debug lzma +handbook openexr samba sftp"

# tests hang, last checked for 4.2.96
RESTRICT="test"

DEPEND="
	!aqua? ( x11-libs/libXcursor )
	bzip2? ( app-arch/bzip2 )
	exif? ( media-gfx/exiv2 )
	lzma? ( app-arch/xz-utils )
	openexr? ( media-libs/openexr )
	samba? (
		|| (
			=net-fs/samba-3.0*
			>=net-fs/samba-libs-3.4[smbclient]
		)
	)
	sftp? ( >=net-libs/libssh-0.4.0[sftp] )
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep kdelibs 'bzip2?,lzma?')
	$(add_kdebase_dep kdialog)
	virtual/ssh
	!aqua? ( !kernel_SunOS? ( virtual/eject ) )
"

KMEXTRA="
	kioexec
	kdeeject
"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with bzip2 BZip2)
		$(cmake-utils_use_with exif Exiv2)
		$(cmake-utils_use_with lzma LibLZMA)
		$(cmake-utils_use_with openexr OpenEXR)
		$(cmake-utils_use_with samba)
		$(cmake-utils_use_with sftp LibSSH)
	)
	kde4-meta_src_configure
}

pkg_postinst() {
	echo
	elog "Note that if you upgrade strigi, you have to rebuild this package."
	echo

	kde4-meta_pkg_postinst
}
