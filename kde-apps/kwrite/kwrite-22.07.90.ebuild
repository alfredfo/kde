# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME="kate"
ECM_HANDBOOK="optional"
KFMIN=5.96.0
QTMIN=5.15.5
inherit ecm gear.kde.org

DESCRIPTION="Simple text editor based on KDE Frameworks"
HOMEPAGE="https://apps.kde.org/kwrite/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="activities telemetry"

RDEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kjobwidgets-${KFMIN}:5
	>=kde-frameworks/kparts-${KFMIN}:5
	>=kde-frameworks/ktexteditor-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	activities? ( >=kde-frameworks/kactivities-${KFMIN}:5 )
	telemetry? ( dev-libs/kuserfeedback:5 )
"
DEPEND="${RDEPEND}
	>=kde-frameworks/ktextwidgets-${KFMIN}:5
"

PATCHES=( "${FILESDIR}/${KDE_ORG_NAME}-22.07.80-split-build-from-source.patch" )

src_prepare() {
	ecm_src_prepare
	# delete colliding kate translations
	if [[ ${KDE_BUILD_TYPE} = release ]]; then
		find po -type f -name "*po" -and -not -name "kwrite*" -delete || die
		rm -rf po/*/docs/kate* || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SPLIT_FROM_SOURCE=ON
		-DBUILD_addons=FALSE
		-DBUILD_kate=FALSE
		$(cmake_use_find_package activities KF5Activities)
		$(cmake_use_find_package telemetry KUserFeedback)
	)
	use handbook && mycmakeargs+=( -DBUILD_katepart=FALSE )

	ecm_src_configure
}
