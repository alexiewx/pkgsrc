# $NetBSD: Makefile,v 1.15 2011/01/23 07:55:14 markd Exp $

#DISTNAME=	kdepim-runtime-${_KDE_VERSION}
DISTNAME=	kdepim-runtime-4.4.11.1
PKGNAME=	${DISTNAME:S/-4/4-4/}
MASTER_SITES=	${MASTER_SITE_KDE:=kdepim-4.4.11.1/src/}
CATEGORIES=	misc
COMMENT=	Runtime requirements for the KDE PIM tools

.include "../../meta-pkgs/kde4/Makefile.kde4"

# tar: Invalid header, starting valid header search.
EXTRACT_USING=	gtar

# BUILD_MAKE_FLAGS+= VERBOSE=1

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../misc/kdepimlibs4/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
