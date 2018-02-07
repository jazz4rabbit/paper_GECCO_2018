#
# Makefile for acmart package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2016/04/14 21:55:57 boris Exp $
#

#LATEX = pdflatex
PAPER_NAME = main

BUILD_DIR= build


SRC_LIST = $(*.tex */*.tex)

PDF = $(PAPER_NAME).pdf

all: ${PDF}


#%.pdf: $(SRC_LIST) #%.tex samplebody-conf.tex  ACM-Reference-Format.bst
$(PDF): main.tex *.tex body_section/body_section.tex $(SRC_LIST)
	pdflatex -output-directory=$(BUILD_DIR) -shell-escape $(PAPER_NAME)

	#ln -s sample-bibliography.bib $(BUILD_DIR)/sample-bibliography.bib
	cp sample-bibliography.bib $(BUILD_DIR)/sample-bibliography.bib
	cd $(BUILD_DIR) && \
	bibtex $(PAPER_NAME).aux
	#cd $(SRC_DIR) && \
	#openout_any=a bibtex $(BUILD_DIR)/$(PAPER_NAME).aux

	pdflatex -output-directory=$(BUILD_DIR) -shell-escape $(PAPER_NAME)
	pdflatex -output-directory=$(BUILD_DIR) -shell-escape $(PAPER_NAME)
	ln -s $(BUILD_DIR)/$(PAPER_NAME).pdf ./$(PAPER_NAME).pdf



clean:
	$(RM)  $(PAPER).cls *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi
	$(RM) -r $(BUILD_DIR)
	mkdir $(BUILD_DIR)

distclean: clean
	$(RM) $(PDF) *-converted-to.pdf *-epspdf-to.pdf

#
# Archive for the distribution. Includes typeset documentation
#
#archive:  all clean
#	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PAPER).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PAPER); mv ../$(PAPER).tgz .
#
#zip:  all clean
#	zip -r  $(PAPER).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'
#
#documents.zip: all
#	zip $@ acmart.pdf acmguide.pdf sample-*.pdf
