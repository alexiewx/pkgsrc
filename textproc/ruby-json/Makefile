# $NetBSD: Makefile,v 1.16 2011/12/15 16:11:58 taca Exp $

DISTNAME=	json-1.6.5
CATEGORIES=	textproc

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://flori.github.com/json
COMMENT=	Native extension implementation of JSON for Ruby
LICENSE=	ruby-license

GEM_CLEANBUILD=	ext/json/ext/generator/* ext/json/ext/parser/*

post-extract:
	cd ${WRKSRC}; ${FIND} . -xdev -type f -print | ${XARGS} ${CHMOD} g-w

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
