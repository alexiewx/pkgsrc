# $NetBSD: Makefile,v 1.14 2012/01/09 02:54:26 obache Exp $

DISTNAME=	exiv2-0.22
PKGNAME=	exiv2-organize-0.22
PKGREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://www.exiv2.org/

MAINTAINER=	gdt@NetBSD.org
HOMEPAGE=	http://www.exiv2.org/
COMMENT=	Image metadata manipulation
LICENSE=	gnu-gpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes
# The visibility feature seems complicated and causes problems on DragonFly
# (reported by Matt Madden) and on Gentoo (http://bugs.gentoo.org/185907).
CONFIGURE_ARGS+=	--disable-visibility

GCC_REQD+=		3.3
BUILD_DIRS=		contrib/organize
INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/contrib/organize/organize \
		${DESTDIR}${PREFIX}/bin/exiv2-organize

.include "../../mk/compiler.mk"
# GCC 4.4 and above needs this
.if !empty(PKGSRC_COMPILER:Mgcc) && !empty(CC_VERSION:Mgcc-4.[4-9]*)
_WRAP_EXTRA_ARGS.CXX+=	-std=c++0x
.endif

.include "../../graphics/exiv2/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
