# $NetBSD: Makefile,v 1.14 2010/08/21 16:33:42 seb Exp $

DISTNAME=	File-DirSync-1.22
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	3
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=File/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/File-DirSync/
COMMENT=	Perl5 module to synchronize two directories rapidly
LICENSE=	${PERL5_LICENSE}

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/File/DirSync/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
