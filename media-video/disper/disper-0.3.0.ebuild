# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils multilib python

DESCRIPTION="Disper is an on-the-fly display switch utility"
HOMEPAGE="http://willem.engen.nl/projects/disper/"
SRC_URI="http://ppa.launchpad.net/disper-dev/ppa/ubuntu/pool/main/d/disper/disper_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/dispercur
instdir="/usr/share/${PN}"

src_compile() {
	sed -e "s:#PREFIX#/share/${PN}/src:$instdir:" < ${PN}.in > ${PN}
}

src_install() {
	for dir in "" $(find src -type d -print | sed -e 's#src##g') ; do
		insinto "${instdir}${dir}"
		doins "src${dir}"/*
	done
	dodoc README TODO
	dobin ${PN}
}
