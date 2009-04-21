# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="AQEMU is a graphical interface to QEMU emulator. Using Qt4."
HOMEPAGE="http://sourceforge.net/projects/aqemu/"
SRC_URI="http://downloads.sourceforge.net/aqemu/aqemu-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="kvm"

DEPEND="${RDEPEND}"
RDEPEND=">=x11-libs/qt-4.2.3-r1
	 kvm? ( app-emulation/kvm )
         !kvm? ( >=app-emulation/qemu-0.9.0 )
         >=media-libs/libpng-1.2.16
         >=dev-libs/libxml2-2.6.27"

RESTRICT="nomirror"

src_compile() {
	cd ${WORKDIR}"/aqemu-${PV}"
	qmake AQEMU.pro
	make
}

src_install() {
	cd ${WORKDIR}"/aqemu-${PV}"
	newbin AQEMU aqemu
	dodir /usr/share/aqemu || die "Cannot create aqemu folder!"
	insinto /usr/share/aqemu
	doins aqemu_ru.qm
	dodir /usr/share/aqemu/os_icons/ || die "Cannot create os_icons folder!"
	insinto /usr/share/aqemu/os_icons
	doins ./os_icons/*
	dodir /usr/share/aqemu/os_templates/ || die "Cannot create os_templates folder!"
	insinto /usr/share/aqemu/os_templates/
	doins ./os_templates/*
	insinto /usr/share/applications/
	doins ./menu_data/aqemu.desktop || die "Cannot create aqemu application link!"
	insinto /usr/share/menu/
	doins ./menu_data/aqemu || die "Cannot create aqemu menu item!"
	insinto /usr/share/pixmaps/
	doins ./menu_data/*.png || die "Cannot copy AQEMU pixmaps!"
}
