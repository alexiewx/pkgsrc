# $NetBSD: extension.buildlink.mk,v 1.5 2002/01/10 20:44:16 drochner Exp $

# derive a python version from the package name if possible
.if defined(USE_PYPKGPREFIX) && defined(PKGNAME_REQD)
PYTHON_VERSION_REQD?= ${PKGNAME_REQD:C/^py([0-9]*)-.*/\1/}
.endif

.include "../../lang/python/pyversion.mk"

#
# below is what used to be in bsd.python.mk
#

.if defined(PYBINMODULE)
.if ${MACHINE_ARCH} == "mips" || ${MACHINE_ARCH} == "vax"
IGNORE="${PKGNAME} needs dynamic loading"
.endif
.endif

.if exists(${PYTHONBIN})
PYINC!=	${PYTHONBIN} -c "import distutils.sysconfig; \
	print distutils.sysconfig.get_python_inc(0, \"\")"
PYLIB!=	${PYTHONBIN} -c "import distutils.sysconfig; \
	print distutils.sysconfig.get_python_lib(0, 1, \"\")"
PYSITELIB!=	${PYTHONBIN} -c "import distutils.sysconfig; \
		print distutils.sysconfig.get_python_lib(0, 0, \"\")"
.endif

.if defined(PYDISTUTILSPKG)
PYSETUP?=		setup.py
PYSETUPBUILDARGS?=	#empty
PYSETUPINSTALLARGS?=	#empty
PY_PATCHPLIST?=		yes

do-build:
	(cd ${WRKSRC} && ${PYTHONBIN} ${PYSETUP} ${PYSETUPBUILDARGS} build)

do-install:
	(cd ${WRKSRC} && ${PYTHONBIN} ${PYSETUP} ${PYSETUPINSTALLARGS} install)
.endif

.if defined(PY_PATCHPLIST)
PLIST_SUBST+=	PYINC=${PYINC} PYSITELIB=${PYSITELIB}
.endif
