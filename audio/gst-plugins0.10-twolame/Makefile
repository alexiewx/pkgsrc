# $NetBSD: Makefile,v 1.5 2012/02/28 18:43:41 drochner Exp $
#

GST_PLUGINS0.10_NAME=	twolame
GST_PLUGINS0.10_DIRS=	ext/twolame

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../multimedia/gst-plugins0.10-ugly/Makefile.common"
PKGREVISION=1

.include "../../audio/twolame/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
