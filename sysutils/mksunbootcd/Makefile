# $NetBSD: Makefile,v 1.7 2005/03/02 00:41:35 dmcmahill Exp $
#

DISTNAME=	mksunbootcd-1.0
PKGREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://ftp.NetBSD.org/pub/NetBSD/misc/mksunbootcd/

MAINTAINER=	dmcmahill@NetBSD.org
HOMEPAGE=	http://www.NetBSD.org/
COMMENT=	Combines filesystems for Sun computers to make bootable CD-ROM images

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=YES

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mksunbootcd ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/mksunbootcd.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

.include "../../mk/bsd.pkg.mk"
