# $NetBSD: Makefile,v 1.1.1.1 2011/12/16 12:32:50 taca Exp $

DISTNAME=	railties-${RUBY_RAILS_VERSION}
CATEGORIES=	databases

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.rubyonrails.org/
COMMENT=	Tools for creating, working with, and running Rails 3.1
LICENSE=	mit

# Comment out dependency in gemspec but already depends indirectly one.
DEPENDS+=	${RUBY_PKGPREFIX}-thor>=0.14.6<0.15:../../devel/ruby-thor
DEPENDS+=	${RUBY_PKGPREFIX}-rack-ssl>=1.3.2<1.4:../../www/ruby-rack-ssl
#DEPENDS+=	${RUBY_ACTIVESUPPORT_DEPENDS}
DEPENDS+=	${RUBY_ACTIONPACK_DEPENDS}

RUBY_RAILS_SUPPORTED=	31
RUBY_RDOC_REQD=		3.4

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
