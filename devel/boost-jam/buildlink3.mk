# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BOOST_JAM_BUILDLINK3_MK:=	${BOOST_JAM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	boost-jam
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nboost-jam}
BUILDLINK_PACKAGES+=	boost-jam
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}boost-jam

.if !empty(BOOST_JAM_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.boost-jam+=		boost-jam-1.33.*
BUILDLINK_DEPMETHOD.boost-jam?=	build
BUILDLINK_PKGSRCDIR.boost-jam?=	../../devel/boost-jam
.endif	# BOOST_JAM_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
