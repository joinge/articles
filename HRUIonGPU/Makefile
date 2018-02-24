FILE = jrnl_article
BIBFILE = jrnl_article
PDF_READER = okular

all:
	pdflatex $(FILE).tex
	bibtex $(BIBFILE)
	pdflatex $(FILE).tex
	pdflatex $(FILE).tex
# 	dvipdf $(FILE).dvi

read: all
	$(PDF_READER) $(FILE).pdf

backup:
	git commit $(FILE).tex

clean:
	-$(RM) *~
	-$(RM) \#*
	-$(RM) *.dvi
	-$(RM) *.pdf
	-$(RM) *.toc
	-$(RM) *.aux
	-$(RM) *.log
	-$(RM) *.blg
	-$(RM) *.bbl

