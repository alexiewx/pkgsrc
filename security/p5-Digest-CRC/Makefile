# $NetBSD: Makefile,v 1.15 2011/08/09 07:30:08 adam Exp $

DISTNAME=	Digest-CRC-0.17
PKGNAME=	p5-${DISTNAME}
SVR4_PKGNAME=	p5crc
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Digest/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Digest-CRC/
COMMENT=	Perl5 extension interface for cyclic redundancy check algorithms
LICENSE=	public-domain

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/Digest/CRC/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
