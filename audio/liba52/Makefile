# $NetBSD: Makefile,v 1.19 2007/02/22 19:26:06 wiz Exp $
#

DISTNAME=	a52dec-0.7.4
PKGNAME=	${DISTNAME:S/a52dec/liba52/}
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://liba52.sourceforge.net/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://liba52.sourceforge.net/
COMMENT=	Free ATSC A/52 stream decoder library

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes

CONFIGURE_ARGS+=	--disable-oss
CONFIGURE_ARGS+=	--disable-mlib
CONFIGURE_ARGS+=	--enable-shared

# does not work until libdjbfft is shared
#CONFIGURE_ARGS+=	--enable-djbfft
#CONFIGURE_ENV+=	LIBA52_CFLAGS=-I${LOCALBASE}/include/djbfft
#.include "../../math/djbfft/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
