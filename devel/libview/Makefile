# $NetBSD: Makefile,v 1.8 2012/02/06 12:39:55 wiz Exp $
#

DISTNAME=	libview-0.6.4
PKGREVISION=	8
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=view/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://view.sourceforge.net/
COMMENT=	GTK+ widget collection
LICENSE=	modified-bsd

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	libview.pc.in

.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/gtkmm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
