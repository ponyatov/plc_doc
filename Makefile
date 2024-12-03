# var
MODULE ?= HorizonPLC

# dirs
CWD = $(CURDIR)
TMP = $(CWD)/tmp
DOC = $(CWD)/doc

# tool
LATEX = pdflatex -halt-on-error -interaction=batchmode -output-directory=$(TMP) -jobname=$(MODULE)

# src
TEX += $(wildcard tex/*.tex)

..PHONY: doc
doc: doc/$(MODULE).pdf

doc/$(MODULE).pdf: tmp/$(MODULE).pdf
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \
		-dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$@ $<
	ls -la $< $@

tmp/$(MODULE).pdf: $(TEX)
	cd $(CWD)/tex ; $(LATEX) manual && $(LATEX) manual

# install
.PHONY: install update doc ref
install: ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)`
ref:
