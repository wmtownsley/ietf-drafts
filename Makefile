#
# $Id: Makefile $
#
# Author: Markus Stenberg <markus stenberg@iki.fi>
#
# Created:       Mon Jun 17 04:40:32 2013 mstenber
# Last modified: Mon Jun 17 13:45:37 2013 mstenber
# Edit time:     6 min
#

DRAFTS=draft-stenberg-homenet-hybrid-proxy-and-ospf-00.txt

ifndef XML_LIBRARY
XML_LIBRARY=$(HOME)/share/1/ietf-bib
endif

all: $(DRAFTS)

%.txt: %.xml
	XML_LIBRARY=$(XML_LIBRARY) xml2rfc $< --text --html

push: all
	rsync -a draft*.html employees.org:WWW

clean:
	rm -f *.txt *.html
