# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

HOMEPAGE='https://h2o.examle1.net'
LICENSE=MIT
EGIT_REPO_URI="git://github.com/h2o/h2o.git"
inherit git-r3 cmake-utils
EGIT_CHEKCOUT_DIR="${WORKDIR}/all"

KEYWORDS="amd64"
SLOT="git"

DEPEND="dev-util/cmake libwslay? ( net-libs/libwslay )"
RDEPEND="${DEPEND}"

IUSE=""

src_unpack() {
	git-r3_src_unpack
}

src_install() {
	cmake-utils_src_install
}
