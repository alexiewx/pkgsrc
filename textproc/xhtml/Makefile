# $NetBSD: Makefile,v 1.8 2009/04/08 22:43:26 joerg Exp $
#

DISTNAME=	xhtml1
PKGNAME=	xhtml-1.0
PKGREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://www.w3.org/TR/xhtml1/
EXTRACT_SUFX=	.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.w3.org/MarkUp/
COMMENT=	DTDs for the Extensible Hypertext Markup Language

PKG_DESTDIR_SUPPORT=	user-destdir

NO_BUILD=	yes
USE_LANGUAGES=	# empty
USE_TOOLS+=	pax
WRKSRC=		${WRKDIR}/xhtml1-20020801

SGML_CATALOGS=	${PREFIX}/share/xml/xhtml/1.0/xhtml.soc
XML_CATALOGS=	${PREFIX}/share/xml/xhtml/1.0/catalog

INSTALLATION_DIRS=	share/xml/xhtml/1.0

do-install:
	cd ${WRKSRC}/DTD && pax -rwpppm . ${DESTDIR}${PREFIX}/share/xml/xhtml/1.0
	${INSTALL_DATA} ${FILESDIR}/catalog10 \
	    ${DESTDIR}${PREFIX}/share/xml/xhtml/1.0/catalog

.include "../../textproc/xmlcatmgr/catalogs.mk"
.include "../../mk/bsd.pkg.mk"
