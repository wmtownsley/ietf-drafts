#
# $Id: Makefile $
#
# Author: Markus Stenberg <markus stenberg@iki.fi>
#
# Created:       Mon Jun 17 04:40:32 2013 mstenber
# Last modified: Mon Jun 17 13:43:05 2013 mstenber
# Edit time:     5 min
#

DRAFTS=draft-stenberg-homenet-hybrid-proxy-and-ospf-00.txt

ifndef XML_LIBRARY
XML_LIBRARY=$(HOME)/share/1/ietf-bib
endif

all: $(DRAFTS)

%.txt: %.xml
	XML_LIBRARY=$(XML_LIBRARY) xml2rfc $< --text --html

clean:
	rm -f *.txt *.html
