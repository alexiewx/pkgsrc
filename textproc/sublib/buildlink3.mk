# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SUBLIB_BUILDLINK3_MK:=	${SUBLIB_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	sublib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsublib}
BUILDLINK_PACKAGES+=	sublib
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}sublib

.if ${SUBLIB_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.sublib+=	sublib>=0.9
BUILDLINK_PKGSRCDIR.sublib?=	../../textproc/sublib
.endif	# SUBLIB_BUILDLINK3_MK

.include "../../lang/mono/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
