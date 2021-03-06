# $NetBSD$
#

DISTNAME=	SOGo-2.0.0b1
CATEGORIES=	www
MASTER_SITES=	http://www.sogo.nu/files/downloads/SOGo/Sources/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.sogo.nu/
COMMENT=	Groupware server supporting CalDAV, CardDAV and GroupDAV
LICENSE=	gnu-gpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/SOGo
HAS_CONFIGURE=	yes
USE_LANGUAGES=	c
USE_TOOLS+=     gmake

CONFIGURE_ARGS= --enable-debug --disable-strip

SOGOUSER?=	sogo
SOGOGROUP?=	sogo
SOGOETCDIR?=	${PKG_SYSCONFDIR}/sogo
SOGORUNDIR?=	${VARBASE}/sogo
INSTALLATION_DIRS+=	share/examples/SOGo
CONF_FILES=	${DESTDIR}${PREFIX}/share/examples/SOGo/SOGo.conf \
		${PKG_SYSCONFDIR}/SOGo.conf
OWN_DIRS+=	${SOGOETCDIR}
OWN_DIRS+=	${SOGORUNDIR}
OWN_DIRS_PERMS+=	${SOGOETCDIR} ${SOGOUSER} ${SOGOGROUP} 0755
OWN_DIRS_PERMS+=	${SOGORUNDIR} ${SOGOUSER} ${SOGOGROUP} 0755
BUILD_DEFS+=	VARBASE

PKG_GROUPS+=	${SOGOGROUP}
PKG_USERS+=	${SOGOUSER}:${SOGOGROUP}
PKG_HOME.${SOGOUSER}=	${SOGOETCDIR}
PKG_SHELL.${SOGOUSER}=	${SH}
PKG_GECOS.${SOGOUSER}=	SOGo daemon user

FILES_SUBST+=	SOGORUNDIR=${SOGORUNDIR}
FILES_SUBST+=	SOGOETCDIR=${SOGOETCDIR}
FILES_SUBST+=	SOGOUSER=${SOGOUSER}
RCD_SCRIPTS=	sogod

pre-install:
	${SED} -e "s|/usr/GNUstep/System/Library|${PREFIX}/lib/GNUstep|" \
	  ${WRKSRC}/Apache/SOGo.conf > \
	  ${DESTDIR}${PREFIX}/share/examples/SOGo/SOGo.conf
	${SED} -e "s|@PREFIX@|${PREFIX}|" ${FILESDIR}/SOGo.conf >> \
	  ${DESTDIR}${PREFIX}/share/examples/SOGo/SOGo.conf
	${MKDIR} -p ${DESTDIR}${PREFIX}/lib/GNUstep/Frameworks
	${LN} -s ../SOGo/SOGo.framework \
	  ${DESTDIR}${PREFIX}/lib/GNUstep/Frameworks/SOGo.framework

.include "../../devel/gnustep-base/buildlink3.mk"
.include "../../devel/gnustep-make/buildlink3.mk"
.include "../../devel/SOPE/buildlink3.mk"
.include "../../devel/libmemcached/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
