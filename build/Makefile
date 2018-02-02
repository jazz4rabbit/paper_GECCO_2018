#
# Makefile for acmart package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2016/04/14 21:55:57 boris Exp $
#

#LATEX = pdflatex
PAPER_NAME = main

SRC_DIR = ../src
BUILD_DIR= $(realpath .)
#BIN_DIR = ./bin


SRC_LIST = $($(SRC_DIR)/*.tex $(SRC_DIR)/*/*.tex)
BIB_LIST = $($(SRC_DIR)/bib/ACM-Reference-Format.bst $(SRC_DIR)/bib/*.bib)


PDF = $(PAPER_NAME).pdf

all: ${PDF}


#%.pdf: $(SRC_LIST) #%.tex samplebody-conf.tex  ACM-Reference-Format.bst
$(PDF): $(SRC_LIST) $(BIB_LIST)
	cd $(SRC_DIR) && \
	pdflatex -output-directory=$(BUILD_DIR) -shell-escape $(PAPER_NAME)
	#cd $(SRC_DIR) && \
	#pdflatex -output-directory=/home/jazz4rabbit/Library/Latex/GECCO/my_theis/build main.tex

	cd $(SRC_DIR) && \
	openout_any=a bibtex $(BUILD_DIR)/$(PAPER_NAME).aux

	cd $(SRC_DIR) && \
	pdflatex -output-directory=$(BUILD_DIR) $(PAPER_NAME)
	cd $(SRC_DIR) && \
	pdflatex -output-directory=$(BUILD_DIR) $(PAPER_NAME)
	#while ( grep -q '^LaTeX Warning: Label(s) may have changed' $(PAPAER_NAME).log) \
	#do pdflatex -output-directory=$(BUILD_DIR) $(PAPER_NAME); done



clean:
	$(RM)  $(PAPER).cls *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi

distclean: clean
	$(RM) $(PDF) *-converted-to.pdf

#
# Archive for the distribution. Includes typeset documentation
#
archive:  all clean
	COPYFILE_DISABLE=1 tar -C .. -czvf ../$(PAPER).tgz --exclude '*~' --exclude '*.tgz' --exclude '*.zip'  --exclude CVS --exclude '.git*' $(PAPER); mv ../$(PAPER).tgz .

zip:  all clean
	zip -r  $(PAPER).zip * -x '*~' -x '*.tgz' -x '*.zip' -x CVS -x 'CVS/*'

documents.zip: all
	zip $@ acmart.pdf acmguide.pdf sample-*.pdf
