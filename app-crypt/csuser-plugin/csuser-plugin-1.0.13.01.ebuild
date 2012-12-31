# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"

inherit eutils

DESCRIPTION="Mozilla-совместимый бруазерный плагин-криптопровайдер для авторизации на портале http://gosuslugi.ru/"

SRC_URI="x86? ( https://esia.gosuslugi.ru/sia-web/htdocs/plugin/CSuserPlugin.deb )"

HOMEPAGE="http://gosuslugi.ru/"
LICENSE="EULA"
RESTRICT=""
SLOT="0"
KEYWORDS="-* ~x86"
IUSE=""

REQUIRED_USE="amd64? ( multilib )"

# TODO: minimal useflag (I can't do it now, since
# it seems like I brake my token and it is uninitialized now)
RDEPEND=">=sys-apps/pcsc-lite-1.7
	>=app-crypt/asedriveiiie-usb-3.7
	dev-libs/libusb:0
"
DEPEND="${RDEPEND}"

QA_PREBUILT="*"
QA_SONAME_NO_SYMLINK="usr/lib32/.* usr/lib64/.*"

S="${WORKDIR}"

src_unpack() {
	die "Пакет всё ещё не доступен, т.к. я в стадии активной переписки с ростелекомом на счёт amd64-версии"
}

src_prepare() {
	default
	EPATCH_SOURCE="${FILESDIR}/patches" \
	EPATCH_SUFFIX="patch" \
	EPATCH_FORCE="yes" epatch

	epatch_user
}

pkg_postinst() {
	einfo "Run"
	einfo "rc-update add eTSrv default"
	einfo "to add eToken support to default runlevel"
	einfo ""
	einfo "In some cases the eToken will not work after rebooting your system. This can be due to the fact, that your pcscd is not running. The installation of SA-client does not configure the pcscd to start automatically."
}
