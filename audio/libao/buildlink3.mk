# $NetBSD: buildlink3.mk,v 1.2 2004/01/24 03:26:46 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBAO_BUILDLINK3_MK:=	${LIBAO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libao
.endif

.if !empty(LIBAO_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		libao
BUILDLINK_DEPENDS.libao+=	libao>=0.8.4
BUILDLINK_PKGSRCDIR.libao?=	../../audio/libao

.endif	# LIBAO_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
