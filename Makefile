BASEDIR=$(CURDIR)
DOCDIR=$(BASEDIR)/docs

help:
	@echo 'Makefile for mkdocs static site                                     '
	@echo '                                                                    '
	@echo 'Usage:                                                              '
	@echo '   make install            install mkdocs (virtualenv recomended)   '
	@echo '   make server             run DEV server (in http://localhost:8000)'
	@echo '                                                                    '
	@echo '   make deploy             deploy in gh-pages                       '


_link:
	ln -sf $(BASEDIR)/README.md $(DOCDIR)/index.md

_workon:
	workon python-madrid-learn-doc


install:
	$(MAKE) _workon
	pip install mkdocs

server:
	$(MAKE) _link
	$(MAKE) _workon
	mkdocs server

deploy:
	$(MAKE) _link
	$(MAKE) _workon
	mkdocs gh-deploy --clean
