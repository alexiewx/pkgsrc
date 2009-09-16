# $NetBSD: buildlink3.mk,v 1.4 2009/03/20 19:24:32 joerg Exp $

BUILDLINK_TREE+=	xfce4-mousepad

.if !defined(XFCE4_MOUSEPAD_BUILDLINK3_MK)
XFCE4_MOUSEPAD_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-mousepad+=	xfce4-mousepad>=0.2.16
BUILDLINK_PKGSRCDIR.xfce4-mousepad?=	../../editors/xfce4-mousepad

.endif # XFCE4_MOUSEPAD_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-mousepad
