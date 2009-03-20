# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils subversion

DESCRIPTION="Tapioca QT4 Bindings"
HOMEPAGE="http://tapioca-voip.sourceforge.net/wiki/index.php/Tapioca"
ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/kdesupport/tapioca-qt"

LICENSE="LGPL-2.1"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	net-libs/telepathy-qt
	>=x11-libs/qt-core-4.4:4
	>=x11-libs/qt-dbus-4.4:4
"
RDEPEND="${DEPEND}"

pkg_setup() {
	echo
	ewarn "WARNING! This an experimental ebuild of ${PN} SVN tree. Use at your own risk."
	ewarn "Do _NOT_ file bugs at bugs.gentoo.org because of this ebuild!"
	echo
}
