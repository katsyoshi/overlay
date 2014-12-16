# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit waf-utils

DESCRIPTION="Distributed Online Machine Learning Framework"
HOMEPAGE="http://jubat.us/"
if [ "${PV}" = "9999" ] ; then
	EGIT_REPO_URI="https://github.com/jubatus/jubatus_core.git"
	inherit git-2
	EGIT_SOURCEDIR="${WORKDIR}/9999"
else
	SRC_URI="https://github.com/jubatus/jubatus_core/archive/${PV}.tar.gz"
fi

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+oniguruma re2 ux"

DEPEND="sci-calculators/jubatus_mpio
	   dev-libs/oniguruma
	   re2? ( dev-libs/re2 )
	   ux? ( dev-libs/ux )"
RDEPEND="${DPEND}"

src_unpack() {
	if [ ${PV} != "9999" ] ; then
		unpack ${A}
	fi
}

src_configure() {
	# FIXME: quick hack. copy from waf-utils
	: ${WAF_BINARY:="${S}/waf"}
	tc-export AR CC CPP CXX RANLIB
	CCFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" "${WAF_BINARY}" \
	"--prefix=${EPREFIX}/usr" \
	$(use ux && printf -- "--regexp-library=ux") \
	$(use re2 && printf -- "--regexp-library=re2") \
	"$@" \
	configure || die "configure failed"
}

src_compile() {
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install
}
