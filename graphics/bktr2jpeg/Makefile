# $NetBSD: Makefile,v 1.11 2010/01/18 09:58:56 wiz Exp $
#

DISTNAME=	bktr2jpeg-1.0
PKGREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://core.de/~coto/projects/bktr2jpeg/

MAINTAINER=	coto@core.de
HOMEPAGE=	http://core.de/~coto/projects/bktr2jpeg/
COMMENT=	Write jpeg image captured from /dev/bktr to file

PKG_DESTDIR_SUPPORT=	user-destdir

ONLY_FOR_PLATFORM=	NetBSD-*-* DragonFly-*-* FreeBSD-*-*

MAKE_FLAGS+=	INSTALL=${INSTALL_PROGRAM:Q}
INSTALL_MAKE_FLAGS=	PREFIX=${DESTDIR}${PREFIX}

INSTALLATION_DIRS=	bin

.include "../../mk/jpeg.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
