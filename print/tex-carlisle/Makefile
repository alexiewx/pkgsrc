# $NetBSD: Makefile,v 1.4 2010/05/17 05:23:10 minskim Exp $

DISTNAME=	carlisle
PKGNAME=	tex-${DISTNAME}-2010
TEXLIVE_REV=	18258

MAINTAINER=	minskim@NetBSD.org
COMMENT=	LaTeX packages created by David Carlisle

CONFLICTS+=	teTeX-texmf<=3.0nb13
DEPENDS+=	tex-latex-bin-[0-9]*:../../print/tex-latex-bin
DEPENDS+=	tex-cm-[0-9]*:../../fonts/tex-cm
DEPENDS+=	tex-graphics-[0-9]*:../../print/tex-graphics
DEPENDS+=	tex-latex-[0-9]*:../../print/tex-latex
DEPENDS+=	tex-tools-[0-9]*:../../print/tex-tools

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
