# $NetBSD: Makefile,v 1.1.1.1 2007/09/10 15:50:11 xtraeme Exp $
#

DISTNAME=	libbinio-1.4
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=libbinio/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	jfranz@bsdprojects.net
HOMEPAGE=	http://libbinio.sourceforge.net/
COMMENT=	Binary I/O stream class library

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
INFO_FILES=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	libbinio.pc.in

.include "../../mk/bsd.pkg.mk"
