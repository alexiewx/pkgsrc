# $NetBSD: Makefile,v 1.1.1.1 2011/05/15 00:09:55 wiz Exp $

GCC_VERSION=		4.7
DISTNAME=		gcc-${GCC_VERSION}-20110716
PKGNAME=		gcc47-${GCC_VERSION}
CATEGORIES=		lang
DISTFILES=		${DISTNAME}${EXTRACT_SUFX}
SITES.gcc-4.7-20110716.tar.bz2= \
		ftp://ftp.fu-berlin.de/unix/languages/gcc/snapshots/4.7-20110716/

EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		kuehro@gmx.de
HOMEPAGE=		http://gcc.gnu.org/
COMMENT=		GNU Compiler Collection 4.7
LICENSE=		gnu-gpl-v2 AND gnu-gpl-v3 AND gnu-lgpl-v2 AND gnu-lgpl-v3

NOT_FOR_PLATFORM=	Interix-*-*

DEPENDS+=		zip-[0-9]*:../../archivers/zip
DEPENDS+=		libiconv-[0-9]*:../../converters/libiconv
BUILDLINK_API_DEPENDS.mpfr+=	mpfr>=2.3.1

USE_TOOLS+=		awk:run bash:run perl chmod \
			gmake:run makeinfo msgfmt bison flex gm4 \
			sed:run unzip

PKG_DESTDIR_SUPPORT=	user-destdir

UNLIMIT_RESOURCES+=	datasize
UNLIMIT_RESOURCES+=	stacksize

GCC_SUBPREFIX=		gcc47
GCC_PREFIX=		${PREFIX}/${GCC_SUBPREFIX}
FILES_SUBST+=		PKGNAME=${PKGNAME}
MESSAGE_SUBST+=		GCC_PREFIX=${GCC_PREFIX}

GNU_CONFIGURE=		yes
CONFIG_SHELL=		${TOOLS_PATH.bash}	# to avoid GNU surprises
CONFIGURE_DIRS=		$(WRKDIR)/obj
CONFIGURE_SCRIPT=	$(WRKSRC)/configure

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

.if ${OPSYS} == "Minix"
# Only build C
BUILD_FORTRAN=YES
BUILD_JAVA=NO
BUILD_CXX=YES
BUILD_OBJC=NO

CONFIGURE_ARGS+=  --host=i386-pc-minix --target=i386-pc-minix --build=i386-pc-minix 
CONFIGURE_ARGS+=  --disable-visibility
.endif

# Determine whether to use binutils

# REPLACE_AWK+=	gcc/testsuite/gcc.test-framework/test-framework.awk	\
# 		gcc/mkmap-symver.awk					\
# 		gcc/optc-gen.awk					\
# 		gcc/mkmap-flat.awk					\
# 		gcc/opt-gather.awk					\
# 		gcc/opth-gen.awk					\
# 		gcc/opt-functions.awk

REPLACE_BASH+= contrib/dg-cmp-results.sh
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-patchlist
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-update
REPLACE_BASH+= contrib/reghunt/bin/gcc-svn-update-fix
REPLACE_BASH+= contrib/reghunt/bin/reg-hunt
REPLACE_BASH+= contrib/reghunt/bin/reg-test
REPLACE_BASH+= contrib/reghunt/date_based/reg_periodic
REPLACE_BASH+= contrib/reghunt/date_based/reg_search
REPLACE_BASH+= gcc/dbgcnt.def
REPLACE_BASH+= gcc/testsuite/gcc.test-framework/gen_directive_tests
REPLACE_BASH+= libstdc++-v3/scripts/run_doxygen

# Optional languages - change as required
# Ada could be added although there is a bootstrapping issue.  See
# ../gcc34-ada for guidance
BUILD_DEFS+=		BUILD_CXX BUILD_FORTRAN BUILD_JAVA BUILD_OBJC
BUILD_CXX?=		YES
BUILD_FORTRAN?=		YES
BUILD_JAVA?=		YES
BUILD_OBJC?=		YES

LANGS= c

#.if !empty(BUILD_CXX:M[aA][dD][aA])
#LANGS+= ada
#.endif

.if !empty(BUILD_CXX:M[Yy][Ee][Ss])
LANGS+= c++
.endif

.if !empty(BUILD_FORTRAN:M[Yy][Ee][Ss])
LANGS+= fortran
.endif

.if !empty(BUILD_JAVA:M[Yy][Ee][Ss])
LANGS+= java
EXTRACT_ONLY=		${DISTNAME}${EXTRACT_SUFX}
DISTFILES+=		ecj-4.5.jar
SITES.ecj-4.5.jar= \
		ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/java/ 

REPLACE_PYTHON=		${WRKSRC}/libjava/contrib/aot-compile.in
REPLACE_PYTHON+=	${WRKSRC}/libjava/contrib/aot-compile-rpm.in
CONFIGURE_ARGS+=	--with-ecj-jar=${DISTDIR}/ecj-4.5.jar
.endif

.if !empty(BUILD_OBJC:M[Yy][Ee][Ss])
LANGS+= objc
.endif


CONFIGURE_ARGS+=	--prefix=${GCC_PREFIX:Q}
CONFIGURE_ARGS+=	--enable-languages=${LANGS:Q}
CONFIGURE_ARGS+=	--with-system-zlib
CONFIGURE_ARGS+=	--disable-nls
.if ${OPSYS} != "Minix"
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-threads=posix
.endif
CONFIGURE_ARGS+=	--enable-__cxa_atexit
CONFIGURE_ARGS+=	--enable-long-long
CONFIGURE_ARGS+=	--with-local-prefix=${GCC_PREFIX:Q}
CONFIGURE_ARGS+=	--enable-libssp
CONFIGURE_ARGS+=	--with-gmp=${BUILDLINK_PREFIX.gmp}
CONFIGURE_ARGS+=	--with-mpfr=${BUILDLINK_PREFIX.mpfr}
CONFIGURE_ARGS+=	--with-libiconv-prefix=${PREFIX}
CONFIGURE_ARGS+=	--with-gxx-include-dir=${GCC_PREFIX}/include/c++/
CONFIGURE_ARGS+=	--with-tune=generic
.if ${OPSYS} != "Minix"
CONFIGURE_ARGS+=	--with-ppl-include=${PREFIX}/include
CONFIGURE_ARGS+=	--with-ppl-lib=${PREFIX}/lib
CONFIGURE_ARGS+=	--with-cloog-include=${PREFIX}/include
CONFIGURE_ARGS+=	--with-cloog-lib=${PREFIX}/lib
CONFIGURE_ARGS+=	--enable-cloog-backend=isl
.endif
.if ${OPSYS} == "NetBSD"
CONFIGURE_ARGS+=	--with-ld=${PREFIX}/bin/gnu-ld
CONFIGURE_ARGS+=	--with-libelf=${PREFIX}
MAKE_ENV+=		ac_cv_func_clock_gettime=yes
.endif
.if ${OPSYS} == "Linux"
CONFIGURE_ARGS+=	--disable-libquadmath --disable-libquadmath-support
.endif

CONFIGURE_ENV+=		CONFIG_SHELL=${CONFIG_SHELL}

# ${WRKSRC}/gcc-4.4.1/libjava/contrib/aotcompile.py.in stores the path to
# a 'make' program so we need to make sure we give it the installed 'make' and not
# the tool wrapped one.
CONFIGURE_ENV+=		PKGSRC_MAKE=${TOOLS_PATH.gmake}
MAKE_ENV+=		PKGSRC_MAKE=${TOOLS_PATH.gmake}


# fastjar-0.93 from pkgsrc/archivers/fastjar seems to trigger a build
# failure (seen on NetBSD-5.0/i386) when building java.  So in case
# the fastjar package is installed, make sure the configure script
# doesn't pick it up.
CONFIGURE_ENV+=		JAR=no
MAKE_ENV+=		JAR=no
MAKE_ENV+=		ac_cv_prog_JAR=no

MAKE_ENV+=		ICONVPREFIX=${BUILDLINK_PREFIX.iconv}
MAKE_ENV+=		SHELL=${CONFIG_SHELL}
MAKE_ENV+=		ac_cv_path_ac_cv_prog_chmod=${TOOLS_CHMOD}

# ${WRKSRC}/fixincludes/ looks for sed and compiles the path to sed into
# a binary so we need to make sure we give it the installed sed and not
# the tool wrapped one.
MAKE_ENV+=		ac_cv_path_SED=${TOOLS_SED}
MAKE_ENV+=		lt_cv_path_SED=${TOOLS_SED}

CPPFLAGS+=		-I${BUILDLINK_DIR}/include
CFLAGS+=		-I${BUILDLINK_DIR}/include


# Somone should fix this so it will match the NetBSD system compiler
#.if ${OPSYS} == "NetBSD"
#GCC_PLATFORM=	${LOWER_ARCH}--${LOWER_OPSYS}${APPEND_ELF}
#CONFIGURE_ARGS+=	--host=${GCC_PLATFORM:Q}
#MAKE_ENV+=		AR=/usr/bin/ar
#.endif # NetBSD

LIBS.SunOS+=		-lgmp

TEST_TARGET=	check

pre-configure:
	${MKDIR} ${WRKDIR}/obj
.if ${OPSYS} == "DragonFly"
	${CP} ${FILESDIR}/dragonfly.h ${WRKSRC}/gcc/config/dragonfly.h
	${CP} ${FILESDIR}/dragonfly-spec.h ${WRKSRC}/gcc/config/dragonfly-spec.h
	${CP} ${FILESDIR}/i386-dragonfly.h ${WRKSRC}/gcc/config/i386/dragonfly.h
	${CP} ${FILESDIR}/i386-dragonfly64.h ${WRKSRC}/gcc/config/i386/dragonfly64.h
.endif
.if ${OPSYS} == "Minix"
	${CP} ${FILESDIR}/minix.h ${WRKSRC}/gcc/config/
	${CP} ${FILESDIR}/minix-spec.h ${WRKSRC}/gcc/config/
	${CP} ${FILESDIR}/i386-minix.h ${WRKSRC}/gcc/config/i386/minix.h
	${CP} ${FILESDIR}/gcov-minix-fs-wrapper.h ${WRKSRC}/libgcc/
.endif
.if ${OPSYS} == "NetBSD"
	${CP} ${WRKSRC}/gcc/config/freebsd-stdint.h ${WRKSRC}/gcc/config/netbsd-stdint.h
.endif

do-configure:
	${MKDIR} ${WRKDIR}/obj
	cd ${WRKDIR}/obj; ${SETENV} ${CONFIGURE_ENV} ${CONFIG_SHELL} ${WRKSRC}/configure ${CONFIGURE_ARGS}

do-build:
	(cd ${WRKDIR}/obj && ${SETENV} ${MAKE_ENV} ${GMAKE} -j${MAKE_JOBS:U1:Q} )

do-install:
	(cd ${WRKDIR}/obj && ${SETENV} ${MAKE_ENV} ${GMAKE} install DESTDIR=${DESTDIR})

.include "../../devel/gmp/buildlink3.mk"
.include "../../math/mpcomplex/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../math/mpfr/buildlink3.mk"
.include "../../devel/binutils/buildlink3.mk"
.include "../../devel/libelf/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.if ${OPSYS} != "Minix"
.include "../../wip/cloog/buildlink3.mk"
.include "../../wip/ppl/buildlink3.mk"
.include "../../lang/python/application.mk"
.endif
.include "../../mk/bsd.pkg.mk"
