# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KDE_HANDBOOK="optional"
KMNAME="kdeadmin"
inherit kde4-meta

DESCRIPTION="KDE Task Scheduler"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="!prefix? ( virtual/cron )"
