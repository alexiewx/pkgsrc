# $NetBSD: Makefile,v 1.8 2012/02/28 18:43:43 drochner Exp $
#

GST_PLUGINS0.10_NAME=	soup
GST_PLUGINS0.10_DIRS=	ext/soup

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../multimedia/gst-plugins0.10-good/Makefile.common"
PKGREVISION=1

.include "../../net/libsoup24/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
