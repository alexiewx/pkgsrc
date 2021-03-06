# $NetBSD: buildlink3.mk,v 1.13 2008/01/04 01:25:51 rillig Exp $

BUILDLINK_TREE+=	neXtaw

.if !defined(NEXTAW_BUILDLINK3_MK)
NEXTAW_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.neXtaw+=	neXtaw>=0.15.1
BUILDLINK_ABI_DEPENDS.neXtaw+=	neXtaw>=0.15.1nb2
BUILDLINK_PKGSRCDIR.neXtaw?=	../../x11/neXtaw

.include "../../mk/bsd.fast.prefs.mk"

.  if ${X11_TYPE} == "modular"
.PHONY: buildlink-neXtaw-inc-hack
buildlink-neXtaw-cookie: buildlink-neXtaw-inc-hack

buildlink-neXtaw-inc-hack: buildlink-directories
	[ ! -h ${BUILDLINK_DIR}/include/X11/Xaw ] && \
		${MKDIR} ${BUILDLINK_DIR}/include/X11 && \
		${LN} -s neXtaw ${BUILDLINK_DIR}/include/X11/Xaw
.  endif

LIBXAW?=	-L${BUILDLINK_PREFIX.neXtaw}/lib			\
		${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.neXtaw}/lib	\
		-lneXtaw

.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXmu/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.endif # NEXTAW_BUILDLINK3_MK

BUILDLINK_TREE+=	-neXtaw
