# $NetBSD: Makefile,v 1.29 2011/11/08 12:41:30 dholland Exp $

DISTNAME=	mos201src
PKGNAME=	moscow_ml-2.01
PKGREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	http://www.itu.dk/people/sestoft/mosml/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.dina.kvl.dk/~sestoft/mosml.html
COMMENT=	Moscow ML, a version of Standard ML

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/mosml/src
USE_TOOLS+=	perl pax

BUILD_TARGET=	clean world
MAKE_JOBS_SAFE=	no

INSTALLATION_DIRS+=	share/examples/moscow_ml/calc
INSTALLATION_DIRS+=	share/examples/moscow_ml/cgi
INSTALLATION_DIRS+=	share/examples/moscow_ml/lexyacc
INSTALLATION_DIRS+=	share/examples/moscow_ml/lexyacc/cl
INSTALLATION_DIRS+=	share/examples/moscow_ml/manual
INSTALLATION_DIRS+=	share/examples/moscow_ml/mls
INSTALLATION_DIRS+=	share/examples/moscow_ml/modules
INSTALLATION_DIRS+=	share/examples/moscow_ml/parsercomb
INSTALLATION_DIRS+=	share/examples/moscow_ml/paulson
INSTALLATION_DIRS+=	share/examples/moscow_ml/pretty
INSTALLATION_DIRS+=	share/examples/moscow_ml/small
INSTALLATION_DIRS+=	share/examples/moscow_ml/units
INSTALLATION_DIRS+=	share/examples/moscow_ml/weak
INSTALLATION_DIRS+=	share/examples/moscow_ml/webserver

post-extract:
	${CHMOD} -x ${WRKDIR}/mosml/examples/modules/matrix.sml

post-install:
	cd ${WRKDIR}/mosml/examples && ${PAX} -rw . \
		${DESTDIR}${PREFIX}/share/examples/moscow_ml
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} \
		${DESTDIR}${PREFIX}/share/examples/moscow_ml
	${CHMOD} -R ugo+rX ${DESTDIR}${PREFIX}/share/examples/moscow_ml

.include "../../mk/bsd.pkg.mk"
