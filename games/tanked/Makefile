# $NetBSD: Makefile,v 1.17 2009/06/30 00:07:16 joerg Exp $
#

DISTNAME=		tanked-0.90
PKGREVISION=		3
CATEGORIES=		games x11
MASTER_SITES=		# empty

MAINTAINER=		pkgsrc-users@NetBSD.org
#HOMEPAGE=		http://ogresoft.dyn.ml.org/tanked.html
COMMENT=		Multiplayer internet tank game for X11

PKG_DESTDIR_SUPPORT=	user-destdir
MAKE_JOBS_SAFE=		no

USE_TOOLS=		imake
SETGIDGAME=		yes
INSTALLATION_DIRS+=	bin

SPECIAL_PERMS=		bin/tanked ${SETGID_GAMES_PERMS}

.for dir in maps logs
OWN_DIRS_PERMS+=	share/tanked/${dir}	\
			${GAMES_USER} ${GAMES_GROUP} ${GAMEDIRMODE}
.endfor

post-patch:
	@${TOUCH} ${WRKSRC}/client/tanked.man
	@${MV} ${WRKSRC}/server/maps.list ${WRKSRC}/server/maps.list.bak
	@${SED} -e 's@XXX@${PREFIX}/share/tanked/@' \
		< ${WRKSRC}/server/maps.list.bak > ${WRKSRC}/server/maps.list

.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
