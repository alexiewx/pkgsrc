# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DANTE_BUILDLINK3_MK:=	${DANTE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	dante
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndante}
BUILDLINK_PACKAGES+=	dante

.if !empty(DANTE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.dante+=	dante>=1.1.13
BUILDLINK_PKGSRCDIR.dante?=	../../net/dante
.endif	# DANTE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
