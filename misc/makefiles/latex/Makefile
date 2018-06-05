TEX = xelatex
PRE =  $(TEX) -ini -job-name="preamble" "&pdflatex preamble.tex\dump"
BIB = bibtex
BIB_FILES = references.bib
FILE_NAME = cv_12

.PHONY: all view

all: $(FILE_NAME).pdf
	make $(FILE_NAME).pdf

view: $(FILE_NAME).pdf
	mupdf $(FILE_NAME).pdf

$(FILE_NAME).pdf: $(FILE_NAME).tex $(FILE_NAME).bbl $(FILE_NAME).blg
	$(TEX) $(FILE_NAME).tex

$(FILE_NAME).bbl $(FILE_NAME).blg: $(BIB_FILES) $(FILE_NAME).aux
	$(BIB) $(FILE_NAME)

$(FILE_NAME).aux: $(FILE_NAME).tex
	$(TEX) $(FILE_NAME).tex

$(BIB_FILES): $(FILE_NAME).tex
	$(TEX) $(FILE_NAME).tex

preamble.fmt: preamble.tex
	$(PRE) preamble.tex

clean:
	@rm -rf $(FILE_NAME).bbl $(FILE_NAME).blg $(FILE_NAME).aux $(FILE_NAME).log $(FILE_NAME).pdf
