# $NetBSD: buildlink3.mk,v 1.13 2009/03/20 17:30:12 joerg Exp $

BUILDLINK_TREE+=	py-mxDateTime

.if !defined(PY_MXDATETIME_BUILDLINK3_MK)
PY_MXDATETIME_BUILDLINK3_MK:=

.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-mxDateTime+=	${PYPKGPREFIX}-mxDateTime>=2.0.5
BUILDLINK_ABI_DEPENDS.py-mxDateTime?=	${PYPKGPREFIX}-mxDateTime>=2.0.6nb1
BUILDLINK_PKGSRCDIR.py-mxDateTime?=	../../time/py-mxDateTime
BUILDLINK_INCDIRS.py-mxDateTime+=	${PYSITELIB}/mx/DateTime/mxDateTime
.endif # PY_MXDATETIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-py-mxDateTime
