# $NetBSD: Makefile,v 1.20 2011/08/09 20:53:15 adam Exp $

DISTNAME=	libdvdread-4.2.0
CATEGORIES=	multimedia
MASTER_SITES=	http://dvdnav.mplayerhq.hu/releases/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://dvdnav.mplayerhq.hu/
COMMENT=	DVD access library
LICENSE=	gnu-gpl-v2

PKG_INSTALLATION_TYPES=	overwrite pkgviews
PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		yes
USE_TOOLS+=		aclocal autoconf automake autoreconf gmake
GNU_CONFIGURE=		yes

MESSAGE_SUBST+=		PKGBASE=${PKGBASE}

pre-configure:
	cd ${WRKSRC} && autoreconf -vi

.include "../../mk/bsd.pkg.mk"
