FILE = jrnl_article
BIBFILE = jrnl_article
PDF_READER = okular

all:
	latex $(FILE).tex
	bibtex $(BIBFILE)
	latex $(FILE).tex
	latex $(FILE).tex
	dvipdf $(FILE).dvi

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

