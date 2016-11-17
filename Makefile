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


install:
	pip install mkdocs

server:
	$(MAKE) _link
	mkdocs server

deploy:
	$(MAKE) _link
	mkdocs gh-deploy --clean
