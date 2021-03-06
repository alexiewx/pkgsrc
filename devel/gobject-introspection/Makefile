# $NetBSD: Makefile,v 1.17 2012/03/03 00:12:07 wiz Exp $
#

DISTNAME=	gobject-introspection-1.30.0
PKGREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/gobject-introspection/1.30/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://live.gnome.org/GObjectIntrospection
COMMENT=	GObject Introspection
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	${PYPKGPREFIX}-cElementTree-[0-9]*:../../textproc/py-cElementTree

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config flex bison gmake
GMAKE_REQD=	3.81

CONFIGURE_ARGS+=	--disable-tests

PKGCONFIG_OVERRIDE+=	gobject-introspection-1.0.pc.in
PKGCONFIG_OVERRIDE+=	gobject-introspection-no-export-1.0.pc.in
PYTHON_VERSIONS_ACCEPTED=	27 26 25

SUBST_CLASSES+=	timet
SUBST_STAGE.timet=	pre-configure
SUBST_FILES.timet=	giscanner/ast.py
SUBST_FILES.timet+=	tests/scanner/Foo-1.0-expected.gir \
			tests/scanner/Regress-1.0-expected.gir
.include "../../mk/bsd.prefs.mk"
.if !empty(MACHINE_PLATFORM:MNetBSD-5.99*) || !empty(MACHINE_PLATFORM:MNetBSD-[6-9]*)
SUBST_SED.timet=	-e 's,@TIMET_TYPENAME@,TYPE_INT64,g'
SUBST_SED.timet+=	-e 's,@TIMET_CTYPE@,gint64,g'
.else
SUBST_SED.timet=	-e 's,@TIMET_TYPENAME@,TYPE_LONG,g'
SUBST_SED.timet+=	-e 's,@TIMET_CTYPE@,glong,g'
.endif

# not executable
CHECK_INTERPRETER_SKIP+= lib/gobject-introspection/giscanner/*.py

# needed for test only
#.include "../../graphics/cairo/buildlink3.mk"
TEST_TARGET=	check

BUILDLINK_API_DEPENDS.glib2+= glib2>=2.30.0
.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/libffi/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/bsd.pkg.mk"
