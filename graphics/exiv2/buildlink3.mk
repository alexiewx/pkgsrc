# $NetBSD: buildlink3.mk,v 1.2 2006/06/10 17:03:14 gdt Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EXIV2_BUILDLINK3_MK:=	${EXIV2_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	exiv2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nexiv2}
BUILDLINK_PACKAGES+=	exiv2

.if ${EXIV2_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.exiv2+=	exiv2>=0.10
BUILDLINK_PKGSRCDIR.exiv2?=	../../graphics/exiv2
.endif	# EXIV2_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
