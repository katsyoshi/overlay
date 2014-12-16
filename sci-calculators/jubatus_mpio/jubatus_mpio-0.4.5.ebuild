# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Distributed Online Machine Learning Framework"
HOMEPAGE="http://jubat.us/"
if [ "${PV}" = "9999" ] ; then
	EGIT_REPO_URI="https://github.com/jubatus/jubatus_mpio.git"
	inherit git-2
	EGIT_SOURCEDIR="${WORKDIR}/9999"
else
	SRC_URI="http://download.jubat.us/files/source/jubatus_mpio/jubatus_mpio-${PV}.tar.gz"
fi

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DPEND}"

src_unpack() {
	if [ ${PV} != "9999" ] ; then
		unpack ${A}
	fi
}

src_configure() {
	./configure --prefix="${EPREFIX}/usr" || die "configure failed"
}

src_compile() {
	make  || die "compile failed"
}

src_install() {
	make DESTDIR=${D} install || die "install failed"
}
