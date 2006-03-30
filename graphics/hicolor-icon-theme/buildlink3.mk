# $NetBSD: buildlink3.mk,v 1.3 2006/02/05 23:09:33 joerg Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
HICOLOR_ICON_THEME_BUILDLINK3_MK:=	${HICOLOR_ICON_THEME_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	hicolor-icon-theme
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nhicolor-icon-theme}
BUILDLINK_PACKAGES+=	hicolor-icon-theme

.if !empty(HICOLOR_ICON_THEME_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.hicolor-icon-theme+=	hicolor-icon-theme>=0.4
BUILDLINK_RECOMMENDED.hicolor-icon-theme+=	hicolor-icon-theme>=0.5nb1
BUILDLINK_PKGSRCDIR.hicolor-icon-theme?=../../graphics/hicolor-icon-theme

.include "../../mk/bsd.prefs.mk"

dirs!=	${GREP} "^@dirrm" ${.CURDIR}/../../graphics/hicolor-icon-theme/PLIST | \
	${CUT} -d ' ' -f 2
.  for d in ${dirs}
PRINT_PLIST_AWK+=	/^@dirrm ${d:S/\//\\\//g}$$/ \
			{ print "@comment in hicolor-icon-theme: " $$0; next; }
.  endfor
.  undef dirs

.if !defined(HICOLOR_ICON_THEME_DEPEND_ONLY)
.include  "../../x11/gtk2/buildlink3.mk"
FILES_SUBST+=		GTK_UPDATE_ICON_CACHE="${BUILDLINK_PREFIX.gtk2}/bin/gtk-update-icon-cache"
FILES_SUBST+=		ICON_THEME_DIR="${BUILDLINK_PREFIX.hicolor-icon-theme}/share/icons/hicolor"
INSTALL_TEMPLATE+=	../../graphics/hicolor-icon-theme/files/icon-cache.tmpl
DEINSTALL_TEMPLATE+=	../../graphics/hicolor-icon-theme/files/icon-cache.tmpl
PRINT_PLIST_AWK+=	/^share\/icons\/hicolor\/icon-theme.cache$$/ { next; }

BUILDLINK_TARGETS+=	guic-buildlink-fake
_GUIC_FAKE=		${BUILDLINK_DIR}/bin/gtk-update-icon-cache

.PHONY: guic-buildlink-fake
guic-buildlink-fake:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ ! -f ${_GUIC_FAKE} ]; then					\
		${ECHO_BUILDLINK_MSG} "Creating ${_GUIC_FAKE}";	\
		${MKDIR} ${_GUIC_FAKE:H};				\
		${ECHO} "#!${SH}" > ${_GUIC_FAKE};			\
		${CHMOD} +x ${_GUIC_FAKE};				\
	fi
.endif	# HICOLOR_ICON_THEME_DEPEND_ONLY
.endif	# HICOLOR_ICON_THEME_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
