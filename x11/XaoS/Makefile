# $NetBSD: Makefile,v 1.30 2011/04/22 13:45:15 obache Exp $
#

DISTNAME=		XaoS-3.4
PKGREVISION=		3
CATEGORIES=		x11
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=xaos/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://xaos.sourceforge.net/
COMMENT=		Zoomable fractal rendering doodad
LICENSE=		gnu-gpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir
PKG_INSTALLATION_TYPES=	overwrite pkgviews
USE_TOOLS+=		gmake msgfmt
USE_PKGLOCALEDIR=	YES
GNU_CONFIGURE=		YES
CONFIGURE_ARGS+=	--with-curses-driver=no
# DGA fails to link somehow, XXX should be fixed
CONFIGURE_ARGS+=	--with-dga-driver=no
INFO_FILES=		yes

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Fixing hardcoded paths.
SUBST_STAGE.paths=	post-patch
SUBST_FILES.paths=	configure
SUBST_SED.paths=	-e 's,/usr/share/locale,${PREFIX}/${PKGLOCALEDIR}/locale,g'

INSTALLATION_DIRS=	${PKGINFODIR}

CHECK_PORTABILITY_SKIP+=	help/applehelpconv
BUILDLINK_DEPMETHOD.libXt?=	build

LDFLAGS.SunOS+=		-liconv

.include "../../math/gsl/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
