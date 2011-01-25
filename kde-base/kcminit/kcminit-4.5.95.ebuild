# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdebase-workspace"
inherit kde4-meta

DESCRIPTION="KCMInit - runs startups initialization for Control Modules."
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep ksplash)
"
RDEPEND="${DEPEND}"
