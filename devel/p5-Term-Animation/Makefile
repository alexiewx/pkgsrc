# $NetBSD$
#

DISTNAME=	Term-Animation-2.6
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/~kbaucom/Term-Animation/
COMMENT=	ASCII sprite animation package
LICENSE=	${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	p5-Curses>=1.06:../../devel/p5-Curses

PERL5_PACKLIST=	auto/Term/Animation/.packlist
USE_LANGUAGES=	# none

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
