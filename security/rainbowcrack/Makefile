# $NetBSD: Makefile,v 1.5 2009/08/25 11:57:45 wiz Exp $
#

PKGNAME=		rainbowcrack-1.2
DISTNAME=		rainbowcrack-1.2-src
PKGREVISION=		2
CATEGORIES=		security
MASTER_SITES=		http://www.rainbowcrack.com/downloads/
EXTRACT_SUFX=		.zip
DISTFILES=		rainbowcrack-1.2-src.zip \
                        rainbowcrack-1.2-openbsd-diffs.tar.gz

MAINTAINER=		dhowland@users.sourceforge.net
HOMEPAGE=		http://www.antsight.com/zsl/rainbowcrack/
COMMENT=		Hash cracker

PKG_DESTDIR_SUPPORT=	user-destdir

BUILD_DIRS=		src
USE_LANGUAGES=		c c++
USE_TOOLS+=		patch
MAKE_FILE=		${FILESDIR}/Makefile
USE_OLD_DES_API=	yes
INSTALLATION_DIRS=	bin share/doc/rainbowcrack share/rainbowcrack

pre-patch:
	cd ${WRKSRC}/src && ${PATCH} < ${WRKDIR}/Public.cpp.diff

post-install:
	cd ${WRKSRC}/doc && ${INSTALL_DATA} *.htm \
		${DESTDIR}${PREFIX}/share/doc/rainbowcrack/
	${INSTALL_DATA} ${WRKSRC}/src/charset.txt ${DESTDIR}${PREFIX}/share/rainbowcrack

.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
