# $NetBSD: buildlink3.mk,v 1.26 2012/02/06 12:42:19 wiz Exp $

BUILDLINK_TREE+=	libxfce4util

.if !defined(LIBXFCE4UTIL_BUILDLINK3_MK)
LIBXFCE4UTIL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libxfce4util+=	libxfce4util>=4.6.0
BUILDLINK_ABI_DEPENDS.libxfce4util?=	libxfce4util>=4.6.1nb7
BUILDLINK_PKGSRCDIR.libxfce4util?=	../../x11/libxfce4util

.include "../../devel/glib2/buildlink3.mk"
.endif # LIBXFCE4UTIL_BUILDLINK3_MK

BUILDLINK_TREE+=	-libxfce4util
