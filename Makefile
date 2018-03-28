SOURCE_DOCS := $(wildcard *.md)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.html) \
 $(SOURCE_DOCS:.md=.pdf) 

PANDOC=/usr/bin/pandoc
PANDOC_OPTIONS=--smart --standalone
PANDOC_HTML_OPTIONS=--to html5 --css=styling.css -V lang=fi -V highlighting-css= 
PANDOC_PDF_OPTIONS=

OUTPUT=/www/nipaa.me/howto

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $(OUTPUT)/$@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $(OUTPUT)/$@ $<

.PHONY: all

all: $(EXPORTED_DOCS)

