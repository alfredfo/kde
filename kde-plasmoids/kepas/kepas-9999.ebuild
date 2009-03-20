# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="playground/network"
inherit kde4-base

DESCRIPTION="KDE Easy Publish and Share."
HOMEPAGE="http://www.kde-apps.org/content/show.php?content=73968"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="1"
IUSE="debug oscar zeroconf"

RDEPEND="
	oscar? ( >=kde-base/kopete-${KDE_MINIMAL}[kdeprefix=,oscar] )
	zeroconf? ( >=kde-base/kdnssd-${KDE_MINIMAL}[kdeprefix=] )
"
