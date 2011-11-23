# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git
DESCRIPTION="Programmable Completion for zsh (includes emerge and ebuild commands)"
HOMEPAGE="http://gentoo.org"
#EGIT_REPO_URI="git://github.com/msva/gzc.git"
EGIT_REPO_URI="git://github.com/zsh-users/zsh-completions"
EGIT_TREE="HEAD" # SHA1 id

LICENSE="ZSH"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-shells/zsh"
RDEPEND="${DEPEND}"

#S="${WORKDIR}"/${PN}-${MY_PV}
#
#src_unpack() {
#	unpack ${A}
#	cd "${S}"
#	rm _eix
#}
#
src_install() {
	insinto /usr/share/zsh/site-functions
	doins _*

	dodoc AUTHORS README COPYING
}

pkg_postinst() {
	elog
	elog "If you happen to compile your functions, you may need to delete"
	elog "~/.zcompdump{,.zwc} and recompile to make zsh-completion available"
	elog "to your shell."
	elog
}