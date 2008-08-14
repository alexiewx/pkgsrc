# $NetBSD: options.mk,v 1.2 2008/03/26 20:09:43 tron Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.libgcrypt
PKG_SUPPORTED_OPTIONS=

.include "../../mk/bsd.prefs.mk"

.if ${MACHINE_ARCH} == "i386" && ${OPSYS} != "Darwin"
.  include "../../mk/compiler.mk"
# GCC 3.x (at least 3.3.3 on NetBSD) fails to compile asm() call in
# cipher/rijndael.c:do_padlock()
.  if empty(CC_VERSION:Mgcc-3.*)
PKG_SUPPORTED_OPTIONS+=	via-padlock
PKG_SUGGESTED_OPTIONS+=	via-padlock
.  endif
.endif

.include "../../mk/bsd.options.mk"

.if empty(PKG_OPTIONS:Mvia-padlock)
# Disable VIA Padlock support.
CONFIGURE_ARGS+=        --disable-padlock-support
.endif
