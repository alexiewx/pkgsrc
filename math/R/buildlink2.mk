# $NetBSD$
#
# This Makefile fragment is included by packages that use the R shared library.
#

.if !defined(R_BUILDLINK2_MK)
R_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		R
BUILDLINK_DEPENDS.R?=		R>=1.6.1
BUILDLINK_PKGSRCDIR.R?=		../../math/R

EVAL_PREFIX+=			BUILDLINK_PREFIX.R=R
BUILDLINK_PREFIX.R_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.R=		lib/R/bin/libR.*
BUILDLINK_FILES.R+=		lib/R/include/*
BUILDLINK_FILES.R+=		lib/R/include/R_ext/*

BUILDLINK_CPPFLAGS.R=    -I${BUILDLINK_PREFIX.R}/lib/R/include
BUILDLINK_LDFLAGS.R=     -L${BUILDLINK_PREFIX.R}/lib/R/bin -Wl,-R${BUILDLINK_PREFIX.R}/lib/R/bin

BUILDLINK_TARGETS+=	R-buildlink

R-buildlink: _BUILDLINK_USE

.endif	# R_BUILDLINK2_MK
