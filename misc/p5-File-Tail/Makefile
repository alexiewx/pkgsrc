# $NetBSD: Makefile,v 1.9 2010/08/21 16:35:17 seb Exp $

DISTNAME=	File-Tail-0.99.3
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
SVR4_PKGNAME=	p5fit
CATEGORIES=	misc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/File-Tail/
COMMENT=	Perl5 module for reading from continuously updated files

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-Time-HiRes>1.12:../../time/p5-Time-HiRes

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/File/Tail/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
