# $NetBSD: Makefile,v 1.2 2011/08/14 16:05:39 obache Exp $

DISTNAME=	c_icap-0.1.6
PKGNAME=	${DISTNAME:S/_/-/}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=c-icap/}

MAINTAINER=	adam@NetBSD.org
HOMEPAGE=	http://c-icap.sourceforge.net/
COMMENT=	Implementation of an ICAP server
LICENSE=	gnu-lgpl-v2.1

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-large-files

EGDIR=		${PREFIX}/share/c-icap
CONF_FILES=	${EGDIR}/c-icap.conf.default ${PKG_SYSCONFDIR}/c-icap.conf
CONF_FILES+=	${EGDIR}/c-icap.magic.default ${PKG_SYSCONFDIR}/c-icap.magic

BUILD_DEFS+=		VARBASE

SUBST_CLASSES+=		fix-path
SUBST_STAGE.fix-path=	pre-configure
SUBST_MESSAGE.fix-path=	Fixing paths.
SUBST_FILES.fix-path=	c-icap.conf.in
SUBST_SED.fix-path=	-e 's, @prefix@/var, ${VARBASE},g'
SUBST_SED.fix-path+=	-e 's, /var, ${VARBASE},g'

.include "options.mk"

.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
