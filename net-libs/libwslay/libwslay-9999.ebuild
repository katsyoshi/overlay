# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

HOMEPAGE="http://github.com/tatsuhiro-t/wslay"
LICENSE=MIT
EGIT_REPO_URI="git://github.com/tatsuhiro-t/wslay.git"
inherit git-r3 cmake-utils
EGIT_CHEKCOUT_DIR="${WORKDIR}/all"

KEYWORDS="amd64"
SLOT="git"

DEPEND="dev-util/cmake"
RDEPEND="${DEPEND}"

IUSE=""

src_unpack() {
	git-r3_src_unpack
}

src_install() {
	cmake-utils_src_install
}
