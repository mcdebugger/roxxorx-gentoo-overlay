# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit eutils

MY_P=lib${PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Raterlite a library supporting Raster Data Sources within a SpatiaLite DB."
HOMEPAGE="http://www.gaia-gis.it/spatialite"
SRC_URI="http://www.gaia-gis.it/spatialite/${MY_P}.tar.gz"

LICENSE="MPL-1.1"

KEYWORDS="~x86 ~amd64"
SLOT="0"
IUSE=""

RDEPEND=">=dev-db/sqlite-3
        =sci-libs/spatialite-2.3.1
        sys-libs/zlib
        media-libs/libpng
        media-libs/tiff
        sci-libs/libgeotiff
        media-libs/jpeg
        sci-libs/proj"
DEPEND="${RDEPEND}"

src_configure()
{
	econf || die "Error: econf failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "einstall failed"
}
